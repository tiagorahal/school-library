require_relative '../classes/student'
require_relative '../classes/classroom'
​
describe Student do
  context 'Test Student class' do
    age = 12
    name = 'Luis'
    parent_permission = true
    classroom = Classroom.new
    student = Student.new(age, name, parent_permission)
    student.classroom = classroom
​
    it 'Should be an instance of Student' do
      expect(student).to be_an_instance_of Student
    end
​
    it 'Age sould be equal to 12' do
      expect(student.age).to eq 12
    end
​
    it 'Name should be equal to Luis' do
      expect(student.name).to eq 'Luis'
    end
​
    it 'Parent permission should be equal to true' do
      expect(student.parent_permission).to eq true
    end
​
    it 'Student has a classroom' do
      expect(student.classroom).to be_an_instance_of Classroom
    end
​
    it 'Student can play hooky' do
      expect(student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end