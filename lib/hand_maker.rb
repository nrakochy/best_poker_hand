require 'pry'
require_relative 'card'

class HandMaker
  
  def create_hand_of_cards hand, full_deck
   hand_strings = stringify(hand)
   poker_hand = []
   hand_strings.map{|card| poker_hand << find_card_in_deck(card[0], card[1], full_deck)}
   poker_hand
  end

  def stringify card_hand
    card_hand.map{|card| card.split(//)}
  end

  def find_card_in_deck rank, suit, full_deck
    full_deck.find{|card| card.rank == rank && card.suit == suit}
  end
  
end
