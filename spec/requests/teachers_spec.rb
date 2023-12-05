# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Teachers', type: :request do
  let(:teacher) { FactoryBot.create(:teacher) }
  let(:student) { FactoryBot.create(:student) }

  describe 'POST /teachers/:teacher_id/follow_student' do
    subject(:follow_student) do
      post "/teachers/#{teacher.id}/follow_student", params: { student_id: student.id }
      response
    end

    it 'returns a 200' do
      expect(follow_student).to have_http_status(:ok)
    end

    it 'follows a student' do
      follow_student
      expect(teacher.students).to include(student)
    end

    it 'returns success: true and teacher: TeacherPrinter' do
      expect(follow_student.body).to eq(
        { success: true, teacher: TeacherPrinter.render_as_json(teacher) }.to_json
      )
    end

    context 'when the student not found' do
      subject(:follow_student) do
        post "/teachers/#{teacher.id}/follow_student", params: { student_id: 0 }
        response
      end

      it 'returns a 404' do
        expect(follow_student).to have_http_status(:not_found)
      end

      it 'returns STUDENT_NOT_FOUND error code' do
        expect(follow_student.body).to eq({ error_code: 'STUDENT_NOT_FOUND' }.to_json)
      end
    end

    context 'when the student is already followed' do
      before { teacher.students << student }

      it 'returns a 409' do
        expect(follow_student).to have_http_status(:conflict)
      end

      it 'returns STUDENT_ALREADY_FOLLOWED error code' do
        expect(follow_student.body).to eq({ error_code: 'STUDENT_ALREADY_FOLLOWED' }.to_json)
      end
    end
  end

  describe 'POST /teachers/:teacher_id/unfollow_student' do
    subject(:unfollow_student) do
      delete "/teachers/#{teacher.id}/unfollow_student", params: { student_id: student.id }
      response
    end

    before { teacher.students << student }

    it 'returns a 200' do
      expect(unfollow_student).to have_http_status(:ok)
    end

    it 'unfollows a student' do
      unfollow_student
      expect(teacher.reload.students).not_to include(student)
    end

    it 'returns success: true and teacher: TeacherPrinter' do
      expect(unfollow_student.body).to eq(
        { success: true, teacher: TeacherPrinter.render_as_json(teacher.reload) }.to_json
      )
    end

    context 'when the student is not followed' do
      before { teacher.students.delete(student) }

      it 'returns a 404' do
        expect(unfollow_student).to have_http_status(:not_found)
      end

      it 'returns STUDENT_NOT_FOLLOWED error code' do
        expect(unfollow_student.body).to eq({ error_code: 'STUDENT_NOT_FOLLOWED' }.to_json)
      end
    end
  end

  describe 'GET /teachers/:teacher_id/followed_students' do
    subject(:followed_students) do
      get "/teachers/#{teacher.id}/followed_students"
      response
    end

    before { teacher.students << student }

    it 'returns a 200' do
      expect(followed_students).to have_http_status(:ok)
    end

    it 'returns the list of followed students' do
      expect(followed_students.body).to eq({ teacher: TeacherPrinter.render_as_json(teacher) }.to_json)
    end
  end
end
