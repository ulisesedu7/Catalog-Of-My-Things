require 'json'

class Genre
  attr_reader :items
  attr_accessor :id, :name

  def initialize(name, id = Random.rand(1..10_000))
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.genre = self
  end
end
