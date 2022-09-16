require_relative '../methods/genre'
require_relative '../utils/update_file'

def save_genres(genres)
  genres_data = []

  genres.each do |genre|
    genres_data.push({
                       name: genre.name
                     })
  end

  update_file('genres', genres_data)
end

def load_genres
  loaded_genres = []

  unless File.zero?('./data-storage/genres.json')
    genres_file = File.open('./data-storage/genres.json')
    hash_genres = JSON.parse(genres_file.read)
  end

  unless hash_genres.empty?
    hash_genres.each do |genre|
      loaded_genres << Genre.new(genre['name'])
    end
    genres_file.close
  end

  loaded_genres
end
