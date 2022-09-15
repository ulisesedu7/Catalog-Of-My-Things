require_relative '../app'

def list_of_options
  puts 'Please choose an option by entering a number:'
  puts '[1] - List all books'
  puts '[2] - List all labels'
  puts '[3] - List all games'
  puts '[4] - List all authors'
  puts '[5] - Add a book'
  puts '[6] - Create a game'
  puts '[7] - Create author'
  puts '[0] - exit'
end

# rubocop:disable Metrics/CyclomaticComplexity
def actions(option, app)
  case option
  when 1
    app.list_all_books
  when 2
    app.list_labels
  when 3
    app.game_display
  when 4
    app.author_display
  when 5
    app.create_book
  when 6
    app.game_create
  when 7
    app.author_create
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
    if (1..7).include?(option)
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
