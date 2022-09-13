class App
  def initialize
    @books = []
    @labels = []
    @games = []
  end

  def list_all_books
    puts 'List of books: '
    if @books.empty?
      puts 'No books have been registered!'
      puts ''
    else
      books.each do |book|
        puts "Here's the book #{book.title}"
      end
    end
  end

  def list_labels

  end

  def add_book(book)

  end
end
