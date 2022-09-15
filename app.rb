require_relative './methods/book'
require_relative './app-methods/books_actions'
require_relative './app-methods/label_actions'

class App
  def initialize
    @books = []
    @labels = []
  end

  include BooksActions
  include LabelActions

end
