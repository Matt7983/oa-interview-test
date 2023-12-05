# frozen_string_literal: true

class Student < ApplicationRecord
  has_many :followed_students, dependent: :destroy
end
