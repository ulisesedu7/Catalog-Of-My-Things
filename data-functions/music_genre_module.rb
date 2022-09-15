require_relative '../methods/item'
require_relative './music_album'

module MusicGenreModule
  def list_music_albums
    if @music_album.lenght.zero?
      puts 'There are no music albums'
    else
      print "\n====================================================\n"
      @music_album.each do |music|
        puts "Title: #{music.title}"
        puts "Publish date: #{music.publish_date}"
        puts "On Spotify: #{music.on_spotify}"
        print "\n====================================================\n"
      end
    end
  end
end

def list_genres
  if @genre.lenght.zero?
    puts 'There are no genres'
  else
    @genre.each do |genre|
      puts "Name: #{genre.name}"
    end
  end
end

def add_music_album
  puts 'Please enter the title of the music album'
  title = gets.chomp
  puts 'Please enter the publish date of the music album'
  publish_date = gets.chomp
  puts 'Is the music album on Spotify? (true/false)'
  on_spotify = on_spotify_prompt

  music = MusicAlbum.new(publish_date, on_spotify)
  music.title = title
  new_music = add_additional_info(music)
  @music_album << new_music unless @music_album.include?(new_music)
  save_data(@music_album, 'music_albums')
  puts 'Music album added successfully'
end

def genre_prompt
  print 'Please enter the genre of the music album: '
  name = gets.chomp
  genre = @genre.find { |exist_genre| exist_genre.name == name } || Genre.new(name)
  item.add_genre(genre)
  @genre << genre unless @genre.include?(genre)
  save_data(@genre, 'genres')
  print %("Genre: #{genre.name}" added successfully)
  item
end

def on_spotify_prompt
  while true
    print 'Is it spotify? Select 1 for Yes, 2 for No: '
    on_spotify = gets.chomp.to_i

    case on_spotify
    when 1 then on_spotify = 'yes'
    when 2 then on_spotify = 'no'
    else
      puts 'Please enter a valid option'
      next
    end
    break
  end
  on_spotify
end
