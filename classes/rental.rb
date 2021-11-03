require_relative '../Classes/book'
require_relative '../Classes/student'
require_relative '../Classes/teacher'

class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @date = date

    @person = person
    if person.instance_of?(Teacher) || person.instance_of?(Student)
      person.rentals << self
    else
      person['rentals'] << self
    end

    @book = book
    if book.instance_of?(Book)
      book.rentals << self
    else
      book['rentals'] << self
    end
  end
end