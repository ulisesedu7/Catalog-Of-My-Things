class Item
  attr_accessor :publish_date, :archived

  attr_reader :id

  attr_writer :label, :author, :source, :genre

  def initialize(publish_date, archived: false)
    @id = rand(1..10_000)

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
