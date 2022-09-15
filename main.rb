require_relative './app'
require_relative './utils/call_others'

def list_of_options
  puts 'Please choose an option by entering a number:'
  puts '[1] - List all books'
  puts '[2] - List all music albums'
  puts '[3] - List all games'
  puts '[4] - List all genres'
  puts '[5] - List all labels'
  puts '[6] - List all authors'
  puts '[7] - Add a book'
  puts '[8] - Add a music album'
  puts '[9] - Add a game'
  puts '[0] - exit'
end

# rubocop:disable Metrics/CyclomaticComplexity
def actions(option, app)
  case option
  when 1
    app.list_all_books
  when 2
    puts 'List all music albums'
  when 3
    app.game_display
  when 4
    puts 'List all genres'
  when 5
    app.list_labels
  when 6
    app.author_display
  when 7
    app.create_book
  when 8
    puts 'Add music album'
  when 9
    app.game_create
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def main
  app = App.new
  puts 'Welcome to our app!'
  puts ''
  app.load_data

  loop do
    list_of_options
    option = gets.chomp.to_i
    if (0..10).include?(option)
      puts ''
      actions(option, app)
    else
      puts 'Sorry, wrong option selected'
      puts ''
      sleep(1)
    end
    break if option.zero?
  end
  # Save data Functions
  app.save_data

  puts 'Thanks for using the app!'
end

main

