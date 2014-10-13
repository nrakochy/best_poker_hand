require 'card_maker'

describe CardMaker do 

  it '.stringify returns an array of strings from card_hand input' do 
    expect(CardMaker.new.stringify(['2c'])).to eq([['2', 'c']])
  end

  xit '.create_the_deck populates the value and suit of the 52 available cards' do
    expect(CardMaker.new.create_the_deck).to eq()
  end

  it '.object_maker returs an array of CardMaker objects with value and suit' do 
    card1= double(CardMaker, :value => 2, :suit => 'c')
    card_set = [card1,card1]
     expect(CardMaker.new.object_maker([['2','c'], ['2','c']])).to eq(card_set)
  end



end
