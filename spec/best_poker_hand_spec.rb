require 'spec_helper'

describe BestPokerHand do
  before :each do
    def make_hand poker_hand
      poker_hand.map{|card| Card.new(card[0], card[1])}
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

  describe '.consecutive_five_aces_low?' do
    it 'returns true if five numbers are consecutive' do
      expect(BestPokerHand.new.consecutive_five_aces_low?(['2','3', '4', '5', '6'])).to eq(true)
    end
    
    it 'returns false if five numbers are not consecutive' do
      expect(BestPokerHand.new.consecutive_five_aces_low?(['2','3', '4', '5', '7'])).to eq(false)
    end

    it 'returns false if array includes numbers and face cards that are not consecutive' do 
      expect(BestPokerHand.new.consecutive_five_aces_low?(['5', 'J', '8', 'K', 'A'])).to eq(false)
    end

    it 'returns true with an array starting with aces low' do
      expect(BestPokerHand.new.consecutive_five_aces_low?(['A', '2', '3', '4', '5'])).to eq(true)
    end

  end

  describe '.consecutive_five_face_cards?' do

    it 'returns true if array includes five consecutive with Aces high' do
      expect(BestPokerHand.new.consecutive_five_aces_high?(['10', 'J', 'Q', 'K', 'A'])).to eq(true)
    end

    it 'returns true if array includes five consecutive with only one face card ' do
      expect(BestPokerHand.new.consecutive_five_aces_high?(['7', '8', '9', '10', 'J'])).to eq(true)
    end

  end

  describe '.straight?' do
    it 'returns true if poker hand includes five consecutive cards'  do
      poker_hand = make_hand([['4','C'], ['5', 'C'], ['6', 'C'], ['7', 'C'], ['8', 'C']])
      expect(BestPokerHand.new.straight?(poker_hand, @deck)).to eq(true)
    end
  end

  describe '.flush?' do
    it 'returns false if poker hand does not include five of the same suit'  do
      poker_hand = make_hand([['4','H'], ['5', 'C'], ['6', 'C'], ['7', 'C'], ['8', 'C']])
      expect(BestPokerHand.new.flush?(poker_hand)).to eq(false)
    end

    it 'returns true if poker hand includes five of the same suit'  do
      poker_hand = make_hand([['10','C'], ['5', 'C'], ['6', 'C'], ['7', 'C'], ['8', 'C']])
      expect(BestPokerHand.new.flush?(poker_hand)).to eq(true)
    end

  end

  describe 'straight_flush?' do
    it 'returns true if poker hash includes five of the same suit in numeric rank order' do
      poker_hand = make_hand([['4','C'], ['5', 'C'], ['6', 'C'], ['7', 'C'], ['8', 'C']])
      expect(BestPokerHand.new.straight_flush?(poker_hand, @deck)).to eq(true)
    end

    it 'returns false if poker hand does not include five of the same suit in numeric rank order' do
      poker_hand = make_hand([['4','C'], ['5', 'D'], ['6', 'C'], ['7', 'C'], ['8', 'C']])
      expect(BestPokerHand.new.straight_flush?(poker_hand, @deck)).to eq(false)
    end
  end
end
