# frozen_string_literal: true

class TeacherPrinter < Blueprinter::Base
  identifier :id
  fields :name
  fields :email

  association :students, blueprint: StudentPrinter
end
