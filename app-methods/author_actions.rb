module AuthorActions
  def author_display
    if @authors.empty?
      puts "There isn't any author in our catalog"
    else
      @authors.each_with_index do |author, idx|
        line = "#{idx + 1}) First Name: #{author.first_name}, Last Name: #{author.last_name}, ID: #{author.id}\n"
        print line
      end
      sleep(2)
    end
  end

  def author_create
    first_name, last_name = author_create_options
    author = Author.new(first_name, last_name)
    @authors.push(author)
    write_authors_data

    print 'Author created successfully!'
  end

  def author_create_options
    first_name = give_option('First Name: ')
    last_name = give_option('Last Name: ')
    [first_name, last_name]
  end

  def give_option(option)
    print option.to_s
    gets.chomp
  end
end
