

module BooksActions
  def list_all_books
    puts 'List of books: '
    if @books.empty?
      puts 'No books have been registered!'
      puts ''
    else
      books.each do |book|
        puts "Here's the book #{book.title} that was published on #{book.publish_date}"
      end
    end
  end

  def create_book
    puts 'Add a new book!'
    puts ''
    puts 'Enter a title: '
    title = gets.chomp
    puts 'Enter the publish date in YYYY-MM-DD format: '
    publish_date = gets.chomp.to_i
    puts 'Please enter the publisher: '
    publisher = gets.chomp
    puts 'Please enter a cover state: '
    cover_state = gets.chomp

    book = Book.new(publish_date, publisher, cover_state, title)

    @books.push(book)
    puts 'A book has been created'
  end
end