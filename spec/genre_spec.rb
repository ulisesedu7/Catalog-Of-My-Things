require_relative '../methods/music_album'
require_relative '../methods/genre'

describe Genre do
  genre = Genre.new('Life')
  item = MusicAlbum.new('2022-08-07', true, 'Test')

  it 'expect album to be instance of Genre' do
    expect(genre).to be_instance_of Genre
  end

  it 'expect add_items to add item in items array' do
    genre.add_item(item)

    expect(genre.items.length).to eq(1)
  end

  it 'Expect genre name to be "Life"' do
    expect(genre.name).to eq('Life')
  end
end
