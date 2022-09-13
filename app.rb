require_relative './data-functions/music_json'
require_relative './data-functions/music_genre_module'
require_relative './data-functions/genre_json'
require_relative './data-functions/music_album'
class App
  include MusicAlbumJson
  include MusicGenreModule
  include GenreJson

  def initialize
    @books = []
    @games = []
    @music_album = load_music_albums
    @genres = load_genres
  end
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

  def store_book(book)
    # something with the book
  end
end
