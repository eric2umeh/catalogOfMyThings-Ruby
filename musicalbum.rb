require 'json'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :artist, :on_spotify

  def initialize(name, description, price, artist, on_spotify)
    super(name, description, price)
    @artist = artist
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(*args)
    {
      'artist' => @artist,
      'on_spotify' => @on_spotify
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    new(data['artist'], data['on_spotify'])
  end
end
