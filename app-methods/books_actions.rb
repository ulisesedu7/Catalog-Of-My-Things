require_relative '../utils/call_others'
require_relative '../utils/date_validation'
require_relative '../utils/change_cover'

module BooksActions
  def list_all_books
    puts 'List of books: '
    if @books.empty?
      puts 'No books have been registered!'
    else
      @books.each do |book|
        puts "Here's the book \"#{book.title}\" that was published on \"#{book.publish_date}\""
      end
    end
    puts ''
  end

  def create_book
    @publish_date = []
    puts 'Add a new book!'
    puts ''
    puts 'Enter the book\'s title: '
    title = gets.chomp

    loop do
      puts 'Enter the published date in YYYY-MM-DD format: '
      @publish_date = gets.chomp
      break if date_validation(@publish_date)

      puts 'please enter a valid date'
    end

    puts 'Please enter the publisher: '
    publisher = gets.chomp

    cover_state = change_cover

    book = Book.new(@publish_date, publisher, cover_state, title)

    @books.push(book)
    puts 'The book has been created'

    puts ''
    call_others
  end
end
