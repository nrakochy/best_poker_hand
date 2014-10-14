require_relative 'get_input'
require_relative 'hand_maker'
require_relative 'best_poker_hand'

class Main

  def find_best_poker_hand 
    user_input = GetInput.new.get_input
    poker_hand = HandMaker.new.create_hand_of_cards(user_input)
    best_hand = BestPokerHand.new.determine_value_of_hand(poker_hand)
  end

end

Main.new.find_best_poker_hand
