require_relative './modules/create_items'
require_relative './modules/list_items'
require_relative 'label'
require_relative 'game'
require_relative 'author'
require_relative 'musicalbum'
require_relative 'game_json'
require_relative 'book_json'
require_relative 'musicalbum_json'
require 'json'

class App
  include NewItem
  include ListItems
  include GameData
  include BookData
  include MusicAlbumData

  def initialize
    @books = []
    @labels = [Label.new('The great Gatsby.', 'Red'), Label.new('Terminator', 'Black')]
    @games = []
    @authors = [Author.new('Ermmiyas', 'Demsew'), Author.new('Abebe', 'Kebede'), Author.new('John', 'Smith')]
    @music_albums = []
    @genres = [Genre.new('Classical music'), Genre.new('Hip hop'), Genre.new('Rap')]

    @options = {
      '1' => 'Create an Item',
      '2' => 'List all items.',
      '3' => 'List all labels.',
      '4' => 'List all authors.',
      '5' => 'List all genres.',
      '6' => 'Exit'
    }
  end

  def run
    load_data
    display_welcome_message
    loop do
      display_options
      option = gets.chomp
      process_option(option)
    end
  end

  def exit
    save_data
    display_exit_message
    Kernel.exit
  end

  private

  def load_data
    load_game_data
    load_books_data
    load_music_albums
  end

  def save_data
    save_game_data
    save_books_data
    save_music_albums
  end

  def display_welcome_message
    puts 'Welcome to Your App!'
    puts '********************************'
  end

  def display_exit_message
    puts '********************************'
    puts 'Thank you'
    puts '********************************'
  end

  def display_options
    puts 'Please choose your option:'
    @options.each do |key, value|
      puts "#{key}. #{value}"
    end
  end

  def process_option(option)
    case option
    when '1' then create_item
    when '2' then list_items
    when '3' then list_labels
    when '4' then list_authors
    when '5' then list_genres
    when '6' then exit
    else puts 'Invalid option.'
    end
  end
end
