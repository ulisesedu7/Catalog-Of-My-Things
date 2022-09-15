require_relative '../utils/call_others'

module LabelActions
  def list_labels
    puts 'List of labels: '
    if @labels.empty?
      puts 'No labels have been registered!'
      puts ''
    else
      @labels.each do |label|
        puts "Here's the label \"#{label.title}\" and it's color \"#{label.color}\""
      end
      puts ''
    end
  end

  def create_label
    puts 'Add your label!'
    puts ''
    puts 'Enter the title: '
    title = gets.chomp

    puts 'Enter the color: '
    color = gets.chomp

    label = Label.new(title, color)

    @labels.push(label)
    puts 'The label has been added'
    puts ''
    
    call_others
  end
end