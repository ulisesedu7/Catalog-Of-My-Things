require_relative '../methods/item'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify, :title

  def initialize(publish_date, on_spotify, title, archived: false)
    super(publish_date, id, archived:)
    @on_spotify = on_spotify
    @title = title
  end

  def can_be_archived?
    super && @on_spotify == 'Yes'
  end
end
