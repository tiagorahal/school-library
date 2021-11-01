require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :owner

  def initialize(age, name = 'Unkown', parent_permission = true)
    super(age, name, parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end