require_relative '../Classes/book'
require_relative '../Classes/student'
require_relative '../Classes/teacher'
require_relative '../Classes/rental'
require 'json'

module AppFunctions
  class Show
    def books(list)
      list.each_with_index { |b, i| puts "\n(#{i}) Title: '#{b['title']}' Author: '#{b['author']}'" }
    end

    def people(list)
      list.each_with_index do |person, i|
        puts "\n(#{i}) [#{person['class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    end

    def rentals(list)
      puts "\nPlease enter the id of the person"
      id = gets.chomp

      puts "\nRentals:"
      list.each do |r|
        if id.to_i == r['person']['id']
          puts "Date: #{r['date']}, Book: '#{r['book']['title']}', Author: '#{r['book']['author']}'"
        end
      end
    end

    def options
      puts "\nPlease choose an option by enterin a number:"
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
    end
  end

  class Create
    def initialize
      @show = Show.new
    end

    def book(list)
      puts "\nEnter a book title"
      title = gets.chomp
      puts "\nEnter the author of the book"
      author = gets.chomp
      book = Book.new(title, author)
      add_to_list(list, book, 'book')
    end

    def person(list)
      puts "\nDo you want to create a (0) Student or a (1) Teacher?"
      input = gets.chomp
      puts "\nEnter the age of the person"
      age = gets.chomp
      puts "\nEnter the name of the person"
      name = gets.chomp
      name == '' ? false : name
      student(list, age, name) if input == '0'
      teacher(list, age, name) if input == '1'
    end

    def student(list, age, name)
      puts 'The person has partent_permission?'
      puts '(0) No permission'
      puts '(1) Permission'
      permission = gets.chomp
      student = Student.new(age, name, parent_permission: permission == 1)
      add_to_list(list, student, 'student')
    end

    def teacher(list, age, name)
      puts "\nEnter the specialization of the teacher"
      spec = gets.chomp
      teacher = Teacher.new(spec, age, name)
      add_to_list(list, teacher, 'teacher')
    end

    def rental(list, book_list, people_list)
      puts "\nChoose a book from the list"
      @show.books(book_list)
      book_choice = gets.chomp
      validate_num(book_choice, book_list)
      puts "\nChoose a person"
      @show.people(people_list)
      person_choice = gets.chomp
      validate_num(person_choice, people_list)
      puts "\nPlease enter a date e.g. 01/01/1990"
      date = gets.chomp
      validate_date(date)
      rental = Rental.new(date, people_list[person_choice.to_i], book_list[book_choice.to_i])
      puts 'Created successfully'
      add_to_list(list, rental, 'rental')
    end

    private

    def add_to_list(list, item, type)
      case type
      when 'book'
        list << { 'title' => item.title, 'author' => item.author, 'rentals' => item.rentals }
      when 'student'
        list << { 'id' => item.id, 'class' => item.class, 'age' => item.age, 'name' => item.name,
                  'parent_permission' => item.parent_permission, 'rentals' => item.rentals }
      when 'teacher'
        list << { 'id' => item.id, 'class' => item.class, 'specialization' => item.specialization, 'age' => item.age,
                  'name' => item.name, 'rentals' => item.rentals }
      when 'rental'
        obj = {
          'date' => item.date,
          'book' => { 'title' => item.book['title'], 'author' => item.book['author'] },
          'person' => { 'id' => item.person['id'] }
        }
        list << obj
      end
      'Created sucessfully'
    end

    def validate_num(input, list)
      return unless input.to_i > (list.length - 1) || input == ''

      puts 'Please enter a valid number'
      input = gets.chomp
      validate_num(input, list)
    end

    def validate_date(input)
      return unless input == ''

      puts 'Please enter a valid date'
      input = gets.chomp
      validate_date(input)
    end
  end

  private

  def save_files()
    routes = ['data/books.json', 'data/people.json', 'data/rentals.json']
    data = [@book_list, @people_list, @rentals_list]
    (0..2).each do |i|
      File.open(routes[i], 'w+') do |file|
        file.write(JSON[data[i]])
      end
    end
  end
end
