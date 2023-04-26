require_relative '../genre'
require_relative '../item'

describe Genre do
  before :each do
    @genre = [Genre.new('Rock')]
  end

  it 'should be an instance of Genre class' do
    @genre.each do |genre|
      expect(genre).to be_an_instance_of(Genre)
    end
  end

  it 'should have a name' do
    @genre.each do |genre|
      expect(genre.name).to eq('Rock')
    end
  end

  it 'should add an item to the genre' do
    genre = Genre.new('Rock')
    book = Book.new('Mega', true, '2011-09-09')
    genre.add_item(book)
    expect(genre.items).to eq([book])
  end
end
