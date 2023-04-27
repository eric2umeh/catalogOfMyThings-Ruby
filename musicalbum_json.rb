require 'json'
require_relative 'musicalbum'

module MusicAlbumData
  def save_music_albums
    @json_music_albums = []
    @music_albums.each do |music_album|
      @json_music_albums.push({ 'name' => music_album.name, 'publish_date' => music_album.publish_date,
                                'on_spotify' => music_album.on_spotify })
    end
    File.write('preserve_data/music_album.json', JSON.pretty_generate(@json_music_albums))
  end

  def load_music_albums
    unless File.exist?('preserve_data/music_album.json')
      File.write('preserve_data/music_album.json',
                 JSON.pretty_generate([]))
    end
    JSON.parse(File.read('preserve_data/music_album.json')).map do |music_album|
      @music_albums << MusicAlbum.new(music_album['name'], music_album['publish_date'], music_album['on_spotify'])
    end
  end
end
