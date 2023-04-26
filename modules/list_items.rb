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
    else
      puts 'Invalid Selection.'
    end
  end

  def list_items
    until %w[1].include?(@list_options)
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
end
