# frozen_string_literal: true

class StudentPrinter < Blueprinter::Base
  identifier :id
  fields :name
  fields :email
end
