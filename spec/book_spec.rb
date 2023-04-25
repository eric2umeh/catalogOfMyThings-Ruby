require_relative '../book'

describe Book do
  before :each do
    @book = [Book.new('The Great Gastby', true, '2012-04-03')]
  end

  it 'should be an instance of Book class' do
    @book.each do |book|
      expect(book).to be_an_instance_of(Book)
    end
  end

  it 'should be an instance of Item' do
    @book.each do |book|
      expect(book).to be_kind_of(Item)
    end
  end

  it 'should be able to be archived' do
    can_be_archived = @book[0].send(:can_be_archived?)
    expect(can_be_archived).to eq(true)
  end
end
