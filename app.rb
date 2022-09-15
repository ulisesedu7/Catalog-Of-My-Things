require_relative './methods/game'
require_relative './methods/game_actions'
require_relative './methods/game_json'
require_relative './methods/author'
require_relative './methods/author_json'
require_relative './methods/author_actions'
require_relative './methods/book'
require_relative './methods/label'
require_relative './app-methods/books_actions'
require_relative './app-methods/label_actions'
require_relative './data-functions/book_data'
require_relative './data-functions/label_data'

class App
  attr_accessor :games, :authors, :books, :labels

  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []

    read_authors_from_file
    read_games_from_file
  end

  include GameActions
  include GameJson
  include AuthorJson
  include AuthorActions

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
