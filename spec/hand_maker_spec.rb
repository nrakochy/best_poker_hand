require 'spec_helper'

describe HandMaker do 

  describe '.make_card' do
    it 'returns a Card Object' do
      expect(HandMaker.new.make_card('2', 'C')).to be_a(Card)
    end

    xit 'returns a Card Object' do
      expect(HandMaker.new.make_card('2', 'C')).to be_a(Card)
    end
  end

  describe '.create_hand_of_cards' do
    it 'returns card objects in an array' do
      new_hand = ['2C', '3H', '4D', '6S', '8C']
      expect(HandMaker.new.create_hand_of_cards(new_hand)).to be_a(Array)
    end

  end

end
