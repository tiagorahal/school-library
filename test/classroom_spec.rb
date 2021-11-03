require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
  age = 20
  name = 'John'
  parent_permission = false
  student = Student.new(age, name, parent_permission)
  label = 'B'
  classroom = Classroom.new(label)
  classroom.add_student(student)

  context 'Test Classroom class' do
    it 'Should be an instance if classroom' do
      expect(classroom).to be_an_instance_of Classroom
    end

    it 'Label should be equal to B' do
      expect(classroom.label).to eq 'B'
    end

    it 'A student is added to a classroom' do
      expect(classroom.students.length).to eq 1
    end

    it 'A student is asigned to a classroom' do
      expect(student.classroom).to be_an_instance_of Classroom
    end
  end
end
