require 'spec_helper'

describe Deck do

  before :each do 
    @deck = Deck.new.make_deck_of_cards
  end

  describe '.make_deck_of_cards' do

    it 'creates a deck of card Objects that is 52 cards long' do
      deck = Deck.new.make_deck_of_cards
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
      expect(Deck.new.find_card_in_deck('2', 'C', @deck)).to be_a(Card)
    end

    it 'finds the matching card Object in deck' do
      two_clubs = Deck.new.find_card_in_deck('2', 'C', @deck)
      expect(two_clubs).to equal(@deck.first)
    end
  end

  describe '.isolate_card_components' do 
    it 'returns user input as stringified array' do
      card = '2D'
      expect(Deck.new.isolate_card_components(card)).to eq(['2', 'D'])
    end

    it 'takes 10H and returns string array with length of 2' do
      card = '10H'
      expect(Deck.new.isolate_card_components(card)).to eq(['10', 'H'])
    end
  end

end
