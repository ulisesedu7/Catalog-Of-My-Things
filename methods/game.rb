require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, _id = Random.rand(1..10_000))
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
    @archived = false
  end

  private

  def can_be_archived?
    return true if super && DateTime.now.year - @last_played_at.year > 2

    false
  end
end
