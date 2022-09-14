module GameActions
  def game_display
    if @games.empty?
      puts "There isn't any game in our catalog"
    else
      @games.each_with_index do |game, idx|
        line = "#{idx + 1}) Publish date: #{game.publish_date}, Multiplayer: #{game.multiplayer}, Last date played: #{game.last_played_at} ID: #{game.id}\n" # rubocop:disable Layout/LineLength
        print line
      end
      sleep(2)
    end
  end

  def game_create
    publish_date, last_played_at, multiplayer = game_create_options
    # title, author_first_name, author_last_name, genre,
    #  _cover_state, label_color = game_create_options

    game = Game.new(publish_date, multiplayer, last_played_at)
    # label = Label.new(title, label_color)
    # author = Author.new(1, author_first_name, author_last_name)
    # genre = Genre.new(genre)

    # add_elements(game, label, author, genre)
    # store_elements(label, author, genre)
    @games.push(game)
    write_games_data

    print 'Game created successfully!'
  end

  def game_create_options
    # title = give_option('Title: ')
    # author_first_name = give_option('Author - First name: ')
    # author_last_name = give_option('Author - Last name: ')
    # genre = give_option('Genre: ')
    publish_date = give_option('Publish date (DD/MM/YYYY): ')
    last_played_at = give_option('Last date played (DD/MM/YYYY): ')
    multiplayer = give_option('Multiplayer: ')
    # cover_state = give_option('Cover state: ')
    # label_color = give_option('Label color: ')
    [publish_date, last_played_at, multiplayer]
  end

  def give_option(option)
    print option.to_s

    case option
    when 'Publish date (DD/MM/YYYY): '
      date = gets.chomp

      return date if check_date(date)

      puts 'Please insert a valid date.'
      return give_option('Publish date (DD/MM/YYYY): ')

    when 'Last date played (DD/MM/YYYY): '
      date = gets.chomp
      return date if check_date(date)

      puts 'Please insert a valid date.'
      return give_option('Last date played (DD/MM/YYYY): ')
    end

    gets.chomp
  end

  def check_date(date)
    if date[2] && date[5] == '/'
      d, m, y = date.split('/')
      return Date.valid_date?(y.to_i, d.to_i, m.to_i)
    end
    false
  end
end
