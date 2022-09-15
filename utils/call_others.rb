require_relative '../app-methods/label_actions'

def call_others
  puts 'Do you wish to continue with another option?'
  puts '[1] - Add an Author'
  puts '[2] - Add a Label'
  puts '[3] - Add a Genre'
  puts '[0] - Go back to main menu'

  selection = gets.chomp.to_i

  case selection
  when 1
    puts 'Testing'
  when 2
    create_label
  when 3
    puts 'Testing2'
  when 0
    puts 'Returning to main menu'
    puts ''
  end
end
