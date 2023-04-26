require_relative './modules/create_items'
require_relative './modules/list_items'
require_relative 'label'
require_relative 'game'
require_relative 'author'

class App
  include NewItem
  include ListItems

  def initialize
    @books = []
    @labels = [Label.new('The great Gatsby.', 'Red'), Label.new('Terminator', 'Black')]
    @games = []
    @authors = [Author.new('Ermmiyas', 'Demsew'), Author.new('Abebe', 'Kebede'), Author.new('John', 'Smith')]

    @options = {
      '1' => 'Create an Item',
      '2' => 'List all items.',
      '3' => 'List all labels.',
      '4' => 'Exit'
    }
  end

  def run
    puts 'Welcome to Your Catalog App!'
    puts '********************************'
    loop do
      puts 'Please choose your option:'
      @options.each do |key, value|
        puts "#{key}. #{value}"
      end
      option = gets.chomp
      case option
      when '1' then create_item
      when '2' then list_items
      when '3' then list_labels
      when '4' then exit
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
