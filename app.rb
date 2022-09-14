require_relative './methods/game'
require_relative './methods/game_actions'
require_relative './methods/game_json'
require_relative './methods/author'
require_relative './methods/author_json'
require_relative './methods/author_actions'

class App
  attr_accessor :games, :authors

  def initialize
    @books = []
    @games = []
    @authors = []

    read_authors_from_file
    read_games_from_file
  end

  include GameActions
  include GameJson
  include AuthorJson
  include AuthorActions

  def store_book(book)
    # something with the book
  end
end
