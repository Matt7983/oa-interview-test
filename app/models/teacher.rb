# frozen_string_literal: true

class Teacher < ApplicationRecord
  has_many :followed_students, dependent: :destroy
  has_many :students, through: :followed_students
end
