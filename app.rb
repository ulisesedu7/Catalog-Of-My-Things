# Pure Methods
require_relative './methods/author'
require_relative './methods/book'
require_relative './methods/game'
require_relative './methods/genre'
require_relative './methods/label'
require_relative './methods/music_album'

# Data Methods
require_relative './data-functions/author_json'
require_relative './data-functions/book_data'
require_relative './data-functions/game_json'
require_relative './data-functions/genre_json'
require_relative './data-functions/label_data'
require_relative './data-functions/music_json'

# App methods
require_relative './app-methods/author_actions'
require_relative './app-methods/books_actions'
require_relative './app-methods/game_actions'
require_relative './app-methods/label_actions'
require_relative './app-methods/music_genre_module'

class App
  attr_accessor :games, :authors, :books, :labels

  def initialize
    @books = []
    @labels = []
    @games = []
    @music_album = []
    @genres = []
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

  include MusicAlbumJson
  include MusicGenreModule
  include GenreJson

  def save_data
    save_books(@books)
    save_labels(@labels)
  end

  def load_data
    @books = load_books
    @labels = load_labels
    @music_album = load_music_albums
    @genres = load_genres
  end

  # def save_data(data_array, _file_name)
  #   data = data_array.map(&:to_json)
  #   File.open("#{PATH_TO_JSON}#{data_name}.json", JSON.pretty_generate(data))
  # end
end
