require_relative '../methods/game'

describe Game do
  context 'created' do
    publish_date = '2015-01-01'
    multiplayer = true
    last_played_at = '2019/01/01'

    before(:each) do
      @game = Game.new(publish_date, multiplayer, last_played_at)
    end

    it 'should have a publish date' do
      expect(@game.publish_date).to eq(publish_date)
    end
    it 'should have a multiplayer' do
      expect(@game.multiplayer).to eq(multiplayer)
    end
    it '@game should be an instance of Game' do
      expect(@game).to be_an_instance_of(Game)
    end
    it 'throws an error if last_played_at is not a date' do
      expect { Game.new(publish_date, multiplayer, '2019') }.to raise_error(ArgumentError)
    end
  end
end
