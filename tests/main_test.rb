require_relative '../app'

def list_of_options
  puts 'Please choose an option by entering a number:'
  puts '1'
  puts '2'
  puts '3'
  puts '4'
  puts '5'
  puts '6'
  puts '7 - exit'
end

def actions(option, app)
  case option
  when 1
    puts 'Tests'
  when 3
    app.store_book(book)
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
