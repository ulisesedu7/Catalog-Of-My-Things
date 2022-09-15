require_relative './methods/book'
require_relative './methods/label'
require_relative './app-methods/books_actions'
require_relative './app-methods/label_actions'
require_relative './data-functions/book_data'
require_relative './data-functions/label_data'

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
    save_labels(@labels)
  end

  def load_data
    @books = load_books
    @labels = load_labels
  end

end
