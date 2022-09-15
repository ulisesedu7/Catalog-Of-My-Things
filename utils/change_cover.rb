def change_cover
  puts 'Please enter a cover state (choose a number): '
  puts '[1] - Excelent'
  puts '[2] - Good'
  puts '[3] - Regular'
  puts '[4] - Bad'
  state = gets.chomp.to_i
  case state
  when 1
    cover_state = 'Excelent'
  when 2
    cover_state = 'Good'
  when 3
    cover_state = 'Regular'
  when 4
    cover_state = 'Bad'
  else
    puts 'Wrong option selected'
  end

  cover_state
end
