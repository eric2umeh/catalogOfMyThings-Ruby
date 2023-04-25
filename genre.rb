require 'json'

class Genre
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(*args)
    {
      'name' => @name,
      'items' => @items.map(&:to_json)
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    genre = new(data['name'])
    genre.items = data['items'].map { |item_data| MusicAlbum.from_json(item_data) }
    genre
  end
end
