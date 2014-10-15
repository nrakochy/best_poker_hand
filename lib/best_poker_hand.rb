require 'pry'
require_relative 'output'
require 'set'

class BestPokerHand

  def determine_value_of_hand poker_hand, full_deck
    case
    when straight_flush?(poker_hand, full_deck)
      rank = "Straight Flush"
    when four_of_kind?(poker_hand)
      rank = "Four of a Kind"
    when full_house?(poker_hand)
      rank = "Full House"
    when flush?(poker_hand)
      rank = "Flush"
    when straight?(poker_hand, full_deck)
      rank = "Straight"
    when three_of_kind?(poker_hand)
      rank = "Three of a Kind"
    when two_pair?(poker_hand)
      rank = "Two Pair"
    when pair?(poker_hand)
      rank = "Pair"
    else
      rank = "High Card"
    end

    Output.determined_value(rank)
  end

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

  def straight_flush? poker_hand, full_deck
    flush?(poker_hand) && straight?(poker_hand)
  end

  def straight? poker_hand, full_deck
    hand_arr = []
    poker_hand.each{|card| hand_arr.push(card.rank)}
    consecutive_five?(hand_arr)
  end
  
  def consecutive_five? hand_ranks
    rank_values = ((2..10).to_a.map{|num| num.to_s} + ['J', 'Q', 'K', 'A'])
    sorted_hand = hand_ranks.uniq.sort 
    lowest_card = sorted_hand.first
    
    starting_point = rank_values.index(lowest_card)
    straight = rank_values[starting_point, 5] || false
    hand_ranks == straight
  end

  private
  
    
  def count_suits poker_hand
    poker_hash = Hash.new(0)
    poker_hand.each{|card| poker_hash[card.suit] += 1}
    poker_hash
  end

  def count_face_value poker_hand
    poker_hash = Hash.new(0)
    poker_hand.each{|card| poker_hash[card.rank] += 1}
    poker_hash
  end
end
