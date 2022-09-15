require_relative './methods/book'
require_relative './app-methods/books_actions'
require_relative './app-methods/label_actions'
require_relative './data-functions/book_data'

class App
  attr_accessor :books, :labels 

  def initialize
    @books = []
    @labels = []
  end

  include BooksActions
  include LabelActions

  def save_data
    save_books(@books)
  end

  def load_data
    @books = load_books
  end

end
