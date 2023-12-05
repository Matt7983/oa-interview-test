# frozen_string_literal: true

class TeachersController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_teacher

  def follow_student
    student = find_student

    return render json: { error_code: 'STUDENT_NOT_FOUND' }, status: 404 unless student

    @teacher.students << student

    render json: { success: true, teacher: TeacherPrinter.render_as_json(@teacher) }
  rescue ActiveRecord::RecordNotUnique
    render json: { error_code: 'STUDENT_ALREADY_FOLLOWED' }, status: 409
  end

  def unfollow_student
    student = @teacher.students.find_by_id(params[:student_id])
    return render json: { error_code: 'STUDENT_NOT_FOLLOWED' }, status: 404 unless student

    @teacher.students.delete(student)

    render json: { success: true, teacher: TeacherPrinter.render_as_json(@teacher) }
  end

  def followed_students
    render json: { teacher: TeacherPrinter.render_as_json(@teacher) }
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def find_student
    Student.find_by_id(params[:student_id])
  end
end
