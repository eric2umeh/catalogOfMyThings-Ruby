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
  end
