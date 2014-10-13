require_relative 'card_maker'
class BestPokerHand 

  attr_accessor :hand_value 


  def initialize 
    @hand_rank = {
      1 => :straight_flush, 
      2 => :four_of_kind,
      3 => :full_house,
      4 => :flush,
      5 => :straight,
      6 => :three_of_kind,
      7 => :two_pair,
      8 => :pair,
      9 => :high_card
    }

   # @available_cards = (2..10).to_a + 'J' + 'Q' + 'K' + 'A'
  end

  # [card1, card2, card3, card4, card5]
  def determine_value_of_hand poker_hand
    card_value = nil
    poker_hand.each do |card|
    end
  end

  def count_suits poker_hand
    poker_hash = Hash.new(0)
    poker_hand.each{|card| poker_hash[card.suit] += 1}
    poker_hash
  end
  
  def count_face_value poker_hand
    poker_hash = Hash.new(0)
    poker_hand.each{|card| poker_hash[card.value] += 1}
    poker_hash

  end

#COUNT VALUE  
  def pair? poker_hand
     poker_hash = count_face_value(poker_hand)
     poker_hash.has_value?(2) && !two_pair?(poker_hand)
  end

  def three_of_kind? poker_hand
    poker_hash = count_face_value(poker_hand)
    poker_hash.has_value?(3)
  end

 def four_of_kind? poker_hand
    poker_hash = count_face_value(poker_hand)
    poker_hash.has_value?(4)
 end

 def full_house? poker_hand
    poker_hash = count_face_value(poker_hand)
    poker_hash.has_value?(3) && poker_hash.has_value?(2)
 end

 def two_pair? poker_hand
    poker_hash = count_face_value(poker_hand)
    counter = []
    poker_hash.each_value{|value| counter << value if value == 2}
    counter.length == 2 && !full_house?(poker_hand)
 end


#COUNT SUITS
  def flush? poker_hand
    poker_hash = count_suits(poker_hand)
    poker_hash.has_value?(5)
  end

#CREATE HAND  
  def stringify card_hand
    card_hand.map{|card| card.split(//)}
  end

  def create_card stringified_hand
    poker_hand = []
    stringified_hand.each do |card|
      card_obj = CardMaker.new(card)
      poker_hand << card_obj
    end
    poker_hand
  end
  
  end
