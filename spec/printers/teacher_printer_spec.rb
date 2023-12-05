# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeacherPrinter, type: :printer do
  subject(:render_hash) { described_class.render_as_hash(teacher) }

  let(:teacher) { FactoryBot.create(:teacher) }

  describe 'fields' do
    it { is_expected.to include(id: teacher.id) }
    it { is_expected.to include(name: teacher.name) }
    it { is_expected.to include(email: teacher.email) }
  end
end
