# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudentPrinter, type: :printer do
  subject(:render_hash) { described_class.render_as_hash(student) }

  let(:student) { FactoryBot.create(:student) }

  describe 'fields' do
    it { is_expected.to include(id: student.id) }
    it { is_expected.to include(name: student.name) }
    it { is_expected.to include(email: student.email) }
  end
end
