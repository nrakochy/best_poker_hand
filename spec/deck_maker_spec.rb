require 'spec_helper'

describe DeckMaker do

  before :each do 
    @deck = DeckMaker.new.make_deck_of_cards
  end

  describe '.make_deck_of_cards' do

    it 'creates a deck of card Objects that is 52 cards long' do
      deck = DeckMaker.new.make_deck_of_cards
      expect(deck.length).to eq(52)
    end

    it 'returns an array' do
      expect(@deck.class).to eq(Array)
    end

    it 'creates Card Objects' do
      expect(@deck.first.class).to be(Card)
    end
  end
 
  describe '.find_card_in_deck' do
    it 'returns a Card Object' do
      expect(DeckMaker.new.find_card_in_deck('2', 'C', @deck)).to be_a(Card)
    end

    it 'finds the matching card Object in deck' do
      two_clubs = DeckMaker.new.find_card_in_deck('2', 'C', @deck)
      expect(two_clubs).to equal(@deck.first)
    end
  end

  describe '.stringify' do 
    it 'returns user input as stringified array' do
      card = '2D'
      expect(DeckMaker.new.stringify(card)).to eq(['2', 'D'])
    end

    it 'takes 10H and returns string array with length of 2' do
      card = '10H'
      expect(DeckMaker.new.stringify(card)).to eq(['10', 'H'])
    end
  end

end
