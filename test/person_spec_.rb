require_relative '../classes/person'
​
describe Person do
  context 'check person class' do
    age = 20
    name = 'John'
    parent_permission = false
    person = Person.new(age, name, parent_permission)
​
    it 'should be the class person' do
      expect(person.class).to eq Person
    end
​
    it 'should have an age' do
      expect(person.age).to eq age
    end
​
    it 'should have a name' do
      expect(person.name).to eq name
    end
​
    it 'should have a parent permission' do
      expect(person.parent_permission).to eq parent_permission
    end
​
    it 'should have an unique ID' do
      expect(person.id).to be_kind_of Numeric
    end
​
    it 'shoudl have the rentals array' do
      expect(person.rentals).to be_kind_of Array
    end
​
    it 'should return a true or false ' do
      expect(person.can_use_services?).to be true
    end
​
    it 'should return the name capitalize' do
      expect(person.validate_name).to eq person.name.capitalize
    end
  end
end
