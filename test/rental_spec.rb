require_relative '../classes/rental'
require_relative '../classes/student'
require_relative '../classes/book'

describe Rental do
  context 'Testing Rental class' do
    before(:each) do
      @student = Student.new(15, 'Pedro')
      @book = Book.new('The hobbit', 'J.R.R Tolkien')
      @rental = Rental.new('10/05/2021', @student, @book)
    end

    it 'is an instance of Rental' do
      expect(@rental).to be_an_instance_of Rental
    end

    it 'has the right date' do
      expect(@rental.date).to eql('10/05/2021')
    end

    it 'has the right book' do
      expect(@rental.book.title).to eql('The hobbit')
    end

    it 'has the right person' do
      expect(@rental.person.id).to eql(@student.id)
    end

    it 'creates itself on person rentals list' do
      expect(@student.rentals.length).to be 1
    end

    it 'creates itself on book rentals list' do
      expect(@book.rentals.length).to be 1
    end
  end
end
