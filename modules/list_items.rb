require_relative '../book'
require_relative '../game.rb'

module ListItems
  def initialize
    @list_options = '0'
  end

  def list_options
    puts 'which item would you like to list?'
    puts '1. List all Books'
    puts '2. List all Games'
  end

  def list_selected_item
    case @list_options
    when '1'
      list_books
      
    when '2'
      list_games
    else
      puts 'Invalid Selection.'
    end
  end

  def list_items
    until %w[1, 2].include?(@list_options)
      list_options
      print 'Select the item by number:'
      @list_options = gets.chomp
      list_selected_item
    end
    @list_options = '0'
  end

  def list_books
    puts 'List of all Books'
    puts 'Book list is empty.' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.publisher}"
    end
  end

  def list_labels
    puts "\n List of labels: "
    @labels.each_with_index { |label, index| puts "#{index}) Title: #{label.title} Color: #{label.color}" }
  end

  def list_games
    @games.each_with_index do |game, index|
      puts "#{index + 1} Multiplayer: #{game.multiplayer},
      Last played at: #{game.last_played_at},
      Publish date: #{game.publish_date}"
    end
  end
end
