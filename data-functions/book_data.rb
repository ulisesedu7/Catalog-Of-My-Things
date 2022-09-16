require_relative '../methods/book'
require_relative '../utils/update_file'

def save_books(books)
  books_data = []

  books.each do |book|
    books_data.push({
                      publish_date: book.publish_date,
                      publisher: book.publisher,
                      cover_state: book.cover_state,
                      title: book.title
                    })
  end
  update_file('books', books_data)
end

def load_books
  loaded_books = []

  unless File.zero?('./data-storage/books.json')
    books_file = File.open('./data-storage/books.json')
    hash_books = JSON.parse(books_file.read)
  end

  unless hash_books.empty?
    hash_books.each do |book|
      loaded_books << Book.new(book['publish_date'], book['publisher'], book['cover_state'], book['title'])
    end
    books_file.close
  end

  loaded_books
end
