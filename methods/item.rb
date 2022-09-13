class Item
  attr_accessor :genre, :author, :label, :publish_date, :title

  attr_reader :id, :archived

  attr_writer :label, :author, :source, :genre

  def initialize(publish_date, id = nil, archived = nil, title = nil)
    @id = rand(1..10_000)
    @title = title || 'Untitled'
    @publish_date = publish_date

    @archived = archived
  end

  def can_be_archived?
    return true if @publish_date < (time.now - 31_536_000)

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
