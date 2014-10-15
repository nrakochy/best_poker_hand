require 'pry'
require_relative 'choose_mode'
require_relative 'hand_maker'
require_relative 'deck_maker'
require_relative 'best_poker_hand'

class Main

  def find_best_poker_hand 
    user_input = ChooseMode.new.choose_mode
    full_deck = DeckMaker.new.make_deck_of_cards
    poker_hand = HandMaker.new.create_hand_of_cards(user_input, full_deck)
    best_hand = BestPokerHand.new.determine_value_of_hand(poker_hand, full_deck)
    play_again
  end
  
  def play_again
    Output.play_again
    input = gets.chomp.upcase
    input == 'Y' ? Main.new.find_best_poker_hand : Output.farewell
  end

end

Main.new.find_best_poker_hand
