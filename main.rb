require_relative './app'

def list_of_options
  puts 'Please choose an option by entering a number:'
  puts '1 list all music albums'
  puts '2 create a new music album'
  puts '3'
  puts '4'
  puts '5'
  puts '6'
  puts '7 - exit'
end

def actions(option, _app)
  case option
  when 1 then list_music_albums
  when 2 then add_music_album
  end
end

def main
  app = App.new
  puts 'Welcome to our app!'
  puts ''

  loop do
    list_of_options
    option = gets.chomp.to_i
    if (1..7).include?(option)
      actions(option, app)
    else
      puts 'Sorry, wrong option selected'
      puts ''
      sleep(1)
    end
    break if option == 7
  end

  puts 'Thanks for using the app!'
  save_albums(@albums)
end

main
