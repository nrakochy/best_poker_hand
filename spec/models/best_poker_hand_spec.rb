require 'spec_helper'

describe BestPokerHand do
  before :each do 
    def make_hand poker_hand
      poker_hand.map{|card| CardMaker.new(card)}
    end
  end

  describe 'creating a hand of card objects from input string' do
    it '.stringify returns array of strings from card_hand input' do 
      expect(BestPokerHand.new.stringify(['2c'])).to eq([['2', 'c']])
    end

    xit '.create_card returns an Object of suit and value' do 
      expect(BestPokerHand.new(['2c']).create_card([['2','c']])).to eq([@card1])
    end
  end

  describe 'pair?' do
    it 'returns true if poker_hand includes pair of same rank' do
      poker_hand = make_hand([['2','C'], ['2', 'H'], ['3', 'S'], ['3', 'H'], ['2', 'D']])
      expect(BestPokerHand.new.pair?(poker_hand)).to eq(true)
    end

    it 'returns false if poker_hand does not contain a pair ' do 
      poker_hand = make_hand([['2','C'], ['3', 'H'], ['4', 'S'], ['10', 'H'], ['K', 'D']])
      expect(BestPokerHand.new.pair?(poker_hand)).to eq(false)
    end
  end

  describe '.three_of_kind?' do
    it 'returns true if poker-hand includes 3 cards of same rank' do 
      poker_hand = make_hand([['2','C'], ['2', 'H'], ['3', 'S'], ['3', 'H'], ['2', 'D']])
      expect(BestPokerHand.new.three_of_kind?(poker_hand)).to eq(true)
    end

    it 'returns false if poker-hand does not include 3 cards of same rank' do
      poker_hand = make_hand([['2','C'], ['2', 'H'], ['3', 'S'], ['3', 'H'], ['10', 'D']])
      expect(BestPokerHand.new.three_of_kind?(poker_hand)).to eq(false)
    end
  end
    
  describe '.four_of_kind?' do
    it 'returns true if poker_hand includes 4 cards of same rank' do
      poker_hand = make_hand([['2','C'], ['2', 'H'], ['2', 'S'], ['3', 'H'], ['2', 'D']])
      expect(BestPokerHand.new.four_of_kind?(poker_hand)).to eq(true)
    end

    it 'returns false if poker_hand does not include 4 cards of same rank' do
      poker_hand = make_hand([['2','C'], ['2', 'H'], ['10', 'S'], ['3', 'H'], ['2', 'D']])
      expect(BestPokerHand.new.four_of_kind?(poker_hand)).to eq(false)
    end
  end

  describe '.full_house?' do
    it 'returns true if poker hand includes 3 cards of same rank && two cards of same rank' do
      poker_hand = make_hand([['2','C'], ['2', 'H'], ['2', 'S'], ['3', 'H'], ['3', 'D']])
      expect(BestPokerHand.new.full_house?(poker_hand)).to eq(true)
    end

    it 'returns false if poker hand does not include 3 cards of same rank && two cards of same rank' do
      poker_hand = make_hand([['4','C'], ['2', 'H'], ['2', 'S'], ['3', 'H'], ['3', 'D']])
      expect(BestPokerHand.new.full_house?(poker_hand)).to eq(false)
    end
  end

  describe '.two_pair?' do
    it 'returns true if poker hand contains two pair of cards with matching rank' do
      poker_hand = make_hand([['4','C'], ['4', 'H'], ['2', 'S'], ['3', 'H'], ['3', 'D']])
      expect(BestPokerHand.new.two_pair?(poker_hand)).to eq(true)
    end

    it 'returns false if poker hand does not contain two pairs' do
      poker_hand = make_hand([['4','C'], ['4', 'H'], ['2', 'S'], ['3', 'H'], ['9', 'D']])
      expect(BestPokerHand.new.two_pair?(poker_hand)).to eq(false)
    end
  end
  
  describe '.flush?' do
    it 'returns true if poker hand includes five of the same suit'  do
      poker_hand = make_hand([['4','C'], ['5', 'C'], ['6', 'C'], ['7', 'C'], ['8', 'C']])
      expect(BestPokerHand.new.flush?(poker_hand)).to eq(true)
    end

    it 'returns false if poker hand does not include five of the same suit'  do
      poker_hand = make_hand([['4','H'], ['5', 'C'], ['6', 'C'], ['7', 'C'], ['8', 'C']])
      expect(BestPokerHand.new.flush?(poker_hand)).to eq(false)
    end
  end

  describe 'straight_flush?' do
    it 'returns true if poker hash includes five of the same suit in numeric rank order' do
      poker_hand = make_hand([['4','C'], ['5', 'C'], ['6', 'C'], ['7', 'C'], ['8', 'C']])
      expect(BestPokerHand.new.straight_flush?(poker_hand)).to eq(true)
    end

    it 'returns false if poker hand does not include five of the same suit in numeric rank order' do
      poker_hand = make_hand([['4','C'], ['5', 'D'], ['6', 'C'], ['7', 'C'], ['8', 'C']])
      expect(BestPokerHand.new.straight_flush?(poker_hand)).to eq(false)
    end
  end
end
