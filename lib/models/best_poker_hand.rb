require_relative 'card_maker'
require 'set'

class BestPokerHand 



  def initialize 
  end

  def determine_value_of_hand hand_of_cards

   stringified_hand = stringify(hand_of_cards)
   poker_hand = create_card(stringified_hand)
    case 
    when straight_flush?(poker_hand)
      puts "Best hand = Straight Flush"
    when four_of_kind?(poker_hand)
      puts "Best hand = Four of a Kind"
    when full_house?(poker_hand)
      puts "Best hand = Full House"
    when flush?(poker_hand)
      puts "Best hand = Flush"
    when straight?(poker_hand)
      puts "Best hand = Straight"
    when three_of_kind?(poker_hand)
      puts "Best hand = Three of a Kind"
    when two_pair?(poker_hand)
      puts "Best hand = Two Pair"
    when pair?(poker_hand)
      puts "Best hand = Pair"
    else 
      puts "Best hand = High Card"
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

  def straight_flush? poker_hand
   flush?(poker_hand)  && straight?(poker_hand)
  end

  def straight? poker_hand
      arr = (2..10).to_a
      card_deck = arr.map{|num| num.to_s}
      card_deck_values = (card_deck + ['J', 'Q' , 'K', 'A']).to_set
      face_value_arr = []
      poker_hand.each{|card|face_value_arr.push(card.value)}
      face_value_arr = face_value_arr.uniq.sort.to_set
      face_value_arr.subset?(card_deck_values) && face_value_arr.length == 5 
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

BestPokerHand.new.determine_value_of_hand(['2c', '2h', '4c', '4h', '2s'])
