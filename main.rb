require_relative 'modules/app'
require 'json'
require 'pry'
​
class InputProcess
  include AppFunctions
  def initialize(book_list, people_list, rentals_list)
    @book_list = book_list
    @people_list = people_list
    @rentals_list = rentals_list
    @create = Create.new
    @show = Show.new
    @show.options
    start_app
  end
​
  def start_app
    user_input = gets.chomp.to_i
    case user_input
    when 1
      @show.books(@book_list)
    when 2
      @show.people(@people_list)
    when 3
      @create.person(@people_list)
    when 4
      @create.book(@book_list)
    when 5
      @create.rental(@rentals_list, @book_list, @people_list)
    when 6
      @show.rentals(@rentals_list)
    when 7
      save_files
      return
    end
    main(@book_list, @people_list, @rentals_list)
  end
end
​
def main(book_list_input = [], people_list_input = [], rentals_list_input = [])
  InputProcess.new(book_list_input, people_list_input, rentals_list_input)
end
​
books = File.open('data/books.json', 'r+')
people = File.open('data/people.json', 'r+')
rentals = File.open('data/rentals.json', 'r+')
​
book_list = JSON[books.read]
people_list = JSON[people.read]
rentals_list = JSON[rentals.read]
​
main(book_list, people_list, rentals_list)