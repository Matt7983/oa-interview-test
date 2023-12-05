# frozen_string_literal: true

class FollowedStudent < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  self.primary_keys = :teacher_id, :student_id
end
