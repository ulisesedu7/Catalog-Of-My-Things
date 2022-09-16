require_relative '../methods/item'
require_relative '../methods/music_album'
require_relative '../utils/call_others'
require_relative '../utils/date_validation'

module MusicGenreModule
  def list_music_albums
    if @music_albums.empty?
      puts 'There are no music albums'
      puts ''
    else
      print "\n====================================================\n"
      @music_albums.each do |music|
        puts "Title: #{music.title}"
        puts "Publish date: #{music.publish_date}"
        puts "On Spotify: #{music.on_spotify}"
        print "\n====================================================\n"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts 'There are no genres'
      puts ''
    else
      @genres.each do |genre|
        puts "Name: #{genre.name}"
      end
    end
    puts ''
  end

  def add_music_album
    @publish_date = []
    puts 'Please enter the title of the music album: '
    title = gets.chomp

    loop do
      puts 'Please enter the publish date of the music album in YYYY-MM-DD format: '
      @publish_date = gets.chomp
      break if date_validation(@publish_date)

      puts 'please enter a valid date'
    end

    puts 'Is the music album on Spotify? (true/false)'
    on_spotify = on_spotify_prompt

    music = MusicAlbum.new(@publish_date, on_spotify, title)
    @music_albums.push(music)

    puts 'Music album added successfully'
    puts ''
    call_others
  end

  def genre_prompt
    puts 'Please enter the genre of the music album: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres.push(genre)
    puts "Genre: \"#{genre.name}\" was added successfully"
    puts ''
  end
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
