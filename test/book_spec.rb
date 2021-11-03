require_relative '../classes/book'

describe Book do
  context 'Testing the book class' do
    title = 'The Hobbit'
    author = 'J.R.R Tolkien'
    book = Book.new(title, author)

    it 'should be the class Book' do
      expect(book).to be_an_instance_of(Book)
    end

    it 'should return the title of the book' do
      expect(book.title).to eq(title)
    end

    it 'should return the author of the book' do
      expect(book.author).to eq(author)
    end

    it 'should return the rentals of the book' do
      expect(book.rentals).to eq([])
    end
  end
end
