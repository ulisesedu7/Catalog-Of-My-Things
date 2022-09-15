require_relative './data-functions/music_json'
require_relative './data-functions/music_genre_module'
require_relative './data-functions/genre_json'
require_relative './data-functions/music_album'
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

  def add_additional_info(item)
    option = 0
    loop do
      puts 'Please select an option'
      puts '1. Add label'
      puts '2. Add author'
      puts '3. Add genre'
      puts '4. Exit'
      option = gets.chomp.to_i
      case option
      when 1 then item = label_promp(item)
      when 2 then item = author_promp(item)
      when 3 then item = genre_promp(item)
      when 4 then break
      else puts 'Invalid option'
      end
    end
    item
  end

  def save_data(data_array, _file_name)
    data = data_array.map(&:to_json)
    File.open("#{PATH_TO_JSON}#{data_name}.json", JSON.pretty_generate(data))
  end
end
