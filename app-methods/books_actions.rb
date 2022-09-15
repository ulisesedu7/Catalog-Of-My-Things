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
    puts 'Enter a title: '
    title = gets.chomp

    puts 'Enter the publish date in YYYY-MM-DD format: '
    publish_date = gets.chomp
    date_validation(publish_date)

    puts 'Please enter the publisher: '
    publisher = gets.chomp.to_i

    puts 'Please enter a cover state: '
    puts '[1] - Excelent'
    puts '[2] - Good'
    puts '[3] - Regular'
    puts '[4] - Bad'
    cover_state = gets.chomp.to_i

    book = Book.new(publish_date, publisher, cover_state, title)

    @books.push(book)
    puts 'A book has been created'

    puts ''
    call_others
  end
end