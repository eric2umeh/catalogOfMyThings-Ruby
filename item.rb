require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @id = rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts 'Item has been archieved'
    else
      puts 'Item has not been moved to archieved'
    end
  end

  private

  def can_be_archived?
    publish_year = @publish_date.year
    current_year = Date.current.year
    age_in_years = current_year - publish_year
    age_in_years > 10
  end
end
