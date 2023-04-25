require_relative '../author'
require_relative '../item'
require_relative '../book'

describe Author do
  before :each do
    @author = Author.new('Ermiyas', 'Demsew')
  end

  it 'should be an instance of Author class' do
    expect(@author).to be_an_instance_of(Author)
  end

  it 'Should return the correct value for the first_name attribute' do
    expect(@author.first_name).to eq('Ermiyas')
  end

  it 'Should return the correct value for the last_name attribute' do
    expect(@author.last_name).to eq('Demsew')
  end
end

describe Item do
  before :each do
    @author = Author.new('Ermiyas', 'Demsew')
    @book = Book.new('DC Comics', 'bad', '2022-04-03')
    @item = Item.new('2022-04-03')
  end

  it 'should be an instance of Item class' do
    expect(Item.new('2012-04-03')).to be_an_instance_of(Item)
  end

  it 'Should return the correct value for the publish_date attribute' do
    expect(Item.new('2012-04-03').publish_date).to eq('2012-04-03')
  end

  it 'Should return add_item' do
    @author.add_item(@book)
    expect(@author.items).to eq([@book])
  end
end
