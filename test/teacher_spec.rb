require_relative '../classes/teacher'

describe Teacher do
  context 'Test Teacher class' do
    specialization = 'Math'
    age = 30
    name = 'Trevor'
    teacher = Teacher.new(specialization, age, name)

    it 'Should be an instance of Teacher' do
      expect(teacher).to be_an_instance_of Teacher
    end

    it 'Specialization should be equal to Math' do
      expect(teacher.specialization).to eq 'Math'
    end

    it 'Age should be equal to 30' do
      expect(teacher.age).to eq 30
    end

    it 'Name should be equal to Trevor' do
      expect(teacher.name).to eq 'Trevor'
    end

    it 'Teachers can always use services' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
