require_relative '../book'
require_relative '../game'
require_relative '../musicalbum'

module NewItem
  def initialize
    @item_options = '0'
  end

  def item_options
    puts 'Select item you would like to create?'
    puts '1. Add a Book'
    puts '2. Add a Game'
    puts '3. Add a Music Album'
    puts '4. Go Back'
  end

  def add_selected_item
    case @item_options
    when '1'
      create_book
    when '2'
      create_game
    when '3'
      create_music_album
    when '4'
      go_back
    else
      puts 'Invalid Selection'
    end
  end

  def create_item
    until %w[1 2 3].include?(@item_options)
      item_options
      @item_options = gets.chomp
      add_selected_item
    end
    @item_options = '0'
  end

  def label_book
    list_labels
    print 'Select the label by number below:'
    label_index = gets.chomp.to_i - 1
    @labels[label_index]
  end

  def create_book
    print 'Name the publisher of this book?'
    publisher = gets.chomp
    print 'Enter the date of publish (yyyy-mm-dd):'
    publish_date = gets.chomp
    print 'Is the cover state good or bad? [y/n]:'
    good = gets.chomp.downcase
    good = good == 'y'
    book = Book.new(publisher, good, publish_date)
    label = label_book
    label.add_item(book)
    @books.push(book)
    puts 'Your book has been created successfully!'
    puts '********************************'
  end

  def author_game
    list_authors
    print 'Select the author by number:'
    author_index = gets.chomp.to_i - 1
    @authors[author_index]
  end

  def create_game
    print 'Is It multiplayer(y/n):'
    multiplayer = gets.chomp.downcase
    multiplayer = multiplayer == 'y'

    print 'Enter the last played at (yyyy-mm-dd):'
    last_played_at = gets.chomp

    print 'Enter the publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    game = Game.new(multiplayer, last_played_at, publish_date)
    author = author_game
    author.add_item(game)
    @games << game
    puts 'Game has been created successfully!!!'
    puts '***************************************'
  end

  def genre_music_album
    list_genres
    print 'Select the genre by number:'
    genre_index = gets.chomp.to_i - 1
    @genres[genre_index]
  end

  def create_music_album
    print 'Add your Music Album\'s name:'
    name = gets.chomp
    print 'Published date (yyyy-mm-dd): '
    publish_date = gets.chomp
    print 'Is it on spotify? [y/n]: '
    spotify = gets.chomp.downcase
    spotify = spotify == 'y'
    music_album = MusicAlbum.new(name, publish_date, spotify)
    genre = genre_music_album
    genre.add_item(music_album)
    @music_albums << music_album
    puts 'Music Album has been created.'
    puts '********************************'
  end

  def go_back
    puts "Going back to main menu..."
    sleep(1)
    run
  end

end
