class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label = Random.rand(1...50))
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
