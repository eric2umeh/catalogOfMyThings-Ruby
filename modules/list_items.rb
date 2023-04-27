require_relative '../book'
require_relative '../game'
require_relative '../musicalbum'

module ListItems
  def initialize
    @list_options = '0'
  end

  def list_options
    puts 'which item would you like to list?'
    puts '1. List all Books'
    puts '2. List all Games'
    puts '3. List all Music Albums'
  end

  def list_selected_item
    case @list_options
    when '1'
      list_books

    when '2'
      list_games

    when '3'
      list_music_albums

    else
      puts 'Invalid Selection.'
    end
  end

  def list_items
    until %w[1 2 3].include?(@list_options)
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
    puts 'List of Games: '
    puts 'Are empty. Sorry!!!!' if @games.empty?
    @games.each_with_index do |game, index|
      puts "#{index + 1} Multiplayer: #{game.multiplayer},
      Last played at: #{game.last_played_at},
      Publish date: #{game.publish_date}"
    end
  end

  def list_authors
    puts 'Select the author by number:'
    @authors.each_with_index do |author, index|
      puts "#{index + 1}. #{author.first_name} #{author.last_name}"
    end
  end

  def list_music_albums
    puts 'List of Music Albums:'
    puts 'You have no Music Albums.' if @music_albums.empty?
    @music_albums.each_with_index do |music_album, index|
      puts "#{index + 1}. #{music_album.name}"
    end
  end

  def list_genres
    puts 'List of Genres:'
    puts 'You have no Genres.' if @genres.empty?
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
end
