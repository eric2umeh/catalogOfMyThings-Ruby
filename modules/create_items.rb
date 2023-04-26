require_relative '../book'
require_relative '../game'

module NewItem
  def initialize
    @item_options = '0'
  end

  def item_options
    puts 'Select item you would like to create?'
    puts '1. Add a Book'
    puts '2. Add a Game'
  end

  def add_selected_item
    case @item_options
    when '1'
      create_book
    when '2'
      create_game
    else
      puts 'Invalid Selection'
    end
  end

  def create_item
    until %w[1, 2].include?(@item_options)
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

  def create_game
    print 'Enter the last played at (yyyy-mm-dd):'
    last_played_at = gets.chomp
    print 'Is It multiplayer(y/n):'
    multiplayer = gets.chomp.downcase
    multiplayer = multiplayer == 'y'
    print 'Enter the publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    game = Game.new(last_played_at, multiplayer, publish_date)
    author = author_game
    author.add_item(game)
    @games << game
    puts 'Game has been created successfully!!!'
    puts '***************************************'
  end
end
