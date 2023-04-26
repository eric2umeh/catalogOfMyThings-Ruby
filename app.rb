require_relative './modules/create_items.rb'
require_relative './modules/list_items.rb'

class App
  include NewItem
  include ListItems

  def initialize
    @books = []
    @labels = [Label.new('The great Gatsby.', 'Red'), Label.new('Terminator', 'Black')]

    @options = {
      '1' => 'Create an Item',
      '2' => 'List all items.',
      '3' => 'List all labels.',
      '4' => 'Exit'
    }
  end

  def run
    puts '********************************'
    puts 'Welcome to Your Catalog App!'
    puts '********************************'
    loop do
      puts 'Please choose your option:'
      @options.each do |key, value|
        puts "#{key}. #{value}"
      end
      option = gets.chomp
      case option
      when '1'
        create_item
      when '2'
        list_items
      when '3'
        list_labels
      when '4'
        exit
      else
        puts 'Invalid option.'
      end
    end
  end

  def exit
    puts '********************************'
    puts 'Thank you'
    puts '********************************'
    Kernel.exit
  end
end
