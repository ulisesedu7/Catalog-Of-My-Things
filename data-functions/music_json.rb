require_relative '../methods/music_album'
require_relative '../utils/update_file'

def save_music_albums(music_albums)
  music_album_data = []

  music_albums.each do |music_album|
    music_album_data.push({
                            publish_date: music_album.publish_date,
                            on_spotify: music_album.on_spotify,
                            title: music_album.title
                          })
  end

  update_file('music_albums', music_album_data)
end

def load_music_albums
  loaded_albums = []

  unless File.zero?('./data-storage/music_albums.json')
    music_albums_file = File.open('./data-storage/music_albums.json')
    hash_albums = JSON.parse(music_albums_file.read)
  end

  unless hash_albums.empty?
    hash_albums.each do |album|
      loaded_albums << MusicAlbum.new(album['publish_date'], album['on_spotify'], album['title'])
    end
    music_albums_file.close
  end

  loaded_albums
end
