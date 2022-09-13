require 'date'

class Item
  attr_accessor :archived, :label, :author, :source, :genre

  attr_reader :id, :publish_date

  def initialize(publish_date, id = Random.rand(1..10_000), archived: false)
    @id = id

    @publish_date = Date.parse(publish_date)

    @archived = archived
  end

  # Methods to get the other properties
  def add_author(author)
    @author = author
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_label(label)
    @label = label
  end
  
  # Item specific methods
  def can_be_archived?
    return true if DateTime.today.year - @publish_date.year > 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
