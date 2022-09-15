require_relative '../app-methods/label_actions'
require_relative '../app-methods/music_genre_module'
require_relative '../app-methods/author_actions'

def list_of_others
  puts 'Do you wish to continue with another option?'
  puts '[1] - Add an Author'
  puts '[2] - Add a Label'
  puts '[3] - Add a Genre'
  puts '[0] - Go back to main menu'
end

def call_others
  list_of_others
  selection = gets.chomp.to_i
  if (0..3).include?(selection)
    new_actions(selection)
  elsif selection.zero?
    puts 'Returning to main menu'
    puts ''
  else
    puts 'Sorry, wrong option selected'
    puts ''
    sleep(1)
  end
end

def new_actions(selection)
  case selection
  when 1
    author_create
  when 2
    create_label
  when 3
    genre_prompt
  when 0
    puts 'Returning to main menu'
    puts ''
  end
end
