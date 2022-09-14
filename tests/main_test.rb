require_relative '../app'

def list_of_options
  puts 'Please choose an option by entering a number:'
  puts '1 - Create a game'
  puts '2 - Display games'
  puts '3 - Create an author'
  puts '4 - Display authors'
  puts '5'
  puts '6'
  puts '7 - exit'
end

def actions(option, app)
  case option
  when 1
    app.game_create
  when 2
    app.game_display
  when 3
    app.author_create
  when 4
    app.author_display
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
end

main
