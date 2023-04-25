require_relative '../game'

describe Game do
  before :each do
    @game = Game.new(3, '2012-04-03', '2012-04-03')
  end

  it 'Should return the correct value for the last_played_at attribute' do
    expect(@game.last_played_at).to eq('2012-04-03')
  end

  it 'Should return the correct value for the multiplayer attribute' do
    expect(@game.multiplayer).to eq(3)
  end

  it 'should be able to be archived' do
    can_be_archived = @game.send(:can_be_archived?)
    expect(can_be_archived).to be true
  end

  it 'should be an instance of Game class' do
    expect(@game).to be_an_instance_of(Game)
  end

  it 'should be an instance of Item' do
    expect(@game).to be_kind_of(Item)
  end
end
