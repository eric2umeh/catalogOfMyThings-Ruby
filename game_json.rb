require 'json'

module GameData
  def save_game_data
    @game_data = []
    @games.each do |game|
      @game_data.push('multiplayer' => game.multiplayer,
                      'last_played_at' => game.last_played_at,
                      'publish_date' => game.publish_date)
    end
    File.write('preserve_data/game_data.json', JSON.pretty_generate(@game_data))
  end

  def load_game_data
    unless File.exist?('preserve_data/game_data.json')
      File.write('preserve_data/game_data.json',
                 JSON.pretty_generate([]))
    end
    @game_data = JSON.parse(File.read('preserve_data/game_data.json'))
    @game_data.each do |game|
      @games.push(Game.new(game['multiplayer'], game['last_played_at'], game['publish_date']))
    end
  end
end
