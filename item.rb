require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(publish_date)
    @id = rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def can_be_archived?
    Date.today > Date.iso8601(@publish_date).next_year(10)
  end

  private :can_be_archived?
end
