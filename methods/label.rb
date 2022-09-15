require_relative './item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, items, id)
    id = Random.rand(1..10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_label(self)
  end
end