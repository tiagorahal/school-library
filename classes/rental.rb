require_relative '../classes/book'
require_relative '../classes/student'
require_relative '../classes/teacher'

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