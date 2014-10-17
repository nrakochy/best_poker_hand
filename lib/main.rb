require_relative 'choose_mode'
require_relative 'deck_maker'
require_relative 'best_poker_hand'

class Main

  def find_best_poker_hand 
    mode = ChooseMode.new.choose_mode
    full_deck = DeckMaker.new.make_deck_of_cards
    poker_hand = DeckMaker.new.create_hand_of_cards(mode, full_deck)
    BestPokerHand.new.determine_value_of_hand(poker_hand, full_deck)
    play_again
  end
  
  def play_again
    Output.play_again
    input = gets.chomp.upcase
    input == 'Y' ? Main.new.find_best_poker_hand : Output.farewell
  end

end

Main.new.find_best_poker_hand
