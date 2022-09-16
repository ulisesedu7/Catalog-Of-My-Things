require_relative '../methods/music_album'
require 'date'

describe MusicAlbum do
  before :each do
    @musictest = MusicAlbum.new('2022-12-12', true, true)
  end

  it 'music should be an instance of Music class' do
    expect(@musictest).to be_an_instance_of MusicAlbum
  end

  it 'expect publish date to be correct' do
    expect(@musictest.publish_date).to be_a(Date)
  end

  it 'expect on spotify to be correct' do
    expect(@musictest.on_spotify).to be(true)
  end
end
