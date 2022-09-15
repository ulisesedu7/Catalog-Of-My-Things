

module LabelActions
  def list_labels
    puts 'List of labels: '
    if @labels.empty?
      puts 'No labels have been registered!'
      puts ''
    else
      @labels.each do |label|
        puts "Here's the label #{label}"
      end
    end
  end

  def create_label

  end
end