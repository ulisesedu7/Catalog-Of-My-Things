require_relative '../utils/call_others'
require_relative '../utils/date_validation'

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

    game = Game.new(publish_date, multiplayer, last_played_at)

    @games.push(game)
    write_games_data

    print 'Game created successfully!'
    puts ''
    call_others
  end

  def game_create_options
    publish_date = give_option('Publish date (YYYY-MM-DD): ')
    last_played_at = give_option('Last date played (YYYY-MM-DD): ')
    multiplayer = give_option('Multiplayer: ')
    [publish_date, last_played_at, multiplayer]
  end

  def give_option(option)
    print option.to_s

    case option
    when 'Publish date (YYYY-MM-DD): '
      date = gets.chomp

      if date_validation(date)
        date
      else
        puts 'Please insert a valid date.'
        give_option('Publish date (YYYY-MM-DD): ')
      end

    when 'Last date played (YYYY-MM-DD): '
      date = gets.chomp
      return date if date_validation(date)

      puts 'Please insert a valid date.'
      give_option('Last date played (YYYY-MM-DD): ')
    end
  end
end
