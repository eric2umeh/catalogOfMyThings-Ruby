require_relative '../musicalbum'

describe MusicAlbum do
  before :each do
    @musicalbum = [MusicAlbum.new('Shega', '2011-09-09', true), MusicAlbum.new('Halloo', '2022-09-09', true)]
  end

  it 'should be an instance of Musicalbum class' do
    @musicalbum.each do |musicalbum|
      expect(musicalbum).to be_an_instance_of(MusicAlbum)
    end
  end

  it 'should be an instance of Item' do
    @musicalbum.each do |musicalbum|
      expect(musicalbum).to be_kind_of(Item)
    end
  end

  it 'should be able to be archived' do
    can_be_archived = @musicalbum[0].send(:can_be_archived?)
    expect(can_be_archived).to eq(true)
  end

  it 'should be able to be archived' do
    can_be_archived = @musicalbum[1].send(:can_be_archived?)
    expect(can_be_archived).to eq(false)
  end
end
