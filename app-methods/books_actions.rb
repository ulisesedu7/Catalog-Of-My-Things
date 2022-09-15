require_relative '../utils/call_others'
require_relative '../utils/date_validation'

module BooksActions
  def list_all_books
    puts 'List of books: '
    if @books.empty?
      puts 'No books have been registered!'
      puts ''
    else
      @books.each do |book|
        puts "Here's the book \"#{book.title}\" that was published on \"#{book.publish_date}\""
      end
      puts ''
    end
  end

  def create_book
    puts 'Add a new book!'
    puts ''
    puts 'Enter the book\'s title: '
    title = gets.chomp

    puts 'Enter the published date in YYYY-MM-DD format: '
    publish_date = gets.chomp
    date_validation(publish_date)

    puts 'Please enter the publisher: '
    publisher = gets.chomp

    puts 'Please enter a cover state (choose a number): '
    puts '[1] - Excelent'
    puts '[2] - Good'
    puts '[3] - Regular'
    puts '[4] - Bad'
    state = gets.chomp.to_i
    case state
    when 1
      cover_state = 'Excelent'
    when 2
      cover_state = 'Good'
    when 3
      cover_state = 'Regular'
    when 4
      cover_state = 'Bad'
    end

    book = Book.new(publish_date, publisher, cover_state, title)

    @books.push(book)
    puts 'The book has been created'

    puts ''
    call_others
  end
end