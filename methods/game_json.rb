require 'json'

module GameJson
  def write_games_data
    data = if @games.length.positive?
             @games.map do |game|
               { publish_date: game.publish_date, multiplayer: game.multiplayer, last_played_at: game.last_played_at,
                 id: game.id }
             end
           else
             []
           end
    games_file = File.open('./data-storage/games.json', 'w')
    games_file.write(JSON.pretty_generate(data))
    games_file.close
  end

  def read_games_from_file
    if File.exist?('./data-storage/games.json')
      games_file = File.open('./data-storage/games.json')
      data = JSON.parse(games_file.read)
      data.each do |element|
        @games << Game.new(element['publish_date'], element['multiplayer'], element['last_played_at'], element['id'])
      end
      games_file.close
    else
      @games = []
      write_games_data
    end
  end
end
