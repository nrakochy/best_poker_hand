require_relative 'output'
require_relative 'card'

class DeckMaker  	
  
  def make_deck_of_cards
    num = (2..10).to_a
    rank_values = (num.map{|num| num.to_s} + ['J', 'Q', 'K', 'A'])
    suits = ['C', 'D', 'H', 'S']
    full_deck = []
    suits.each{|suit| rank_values.each{|rank| full_deck << Card.new(rank,suit)}}
    full_deck
  end

  def deck_clone_no_card_objects
    num = (2..10).to_a
    rank_values = (num.map{|num| num.to_s} + ['J', 'Q', 'K', 'A'])
    suits = ['C', 'D', 'H', 'S']
    full_deck = []
    suits.each{|suit| rank_values.each{|rank| full_deck << (rank + suit)}}
    full_deck
  end

  def manual_hand_builder user_input, full_deck
    card_strings = stringify(user_input)
    find_card_in_deck(card_strings[0], card_strings[1], full_deck)
  end

  def stringify card
    if card.length == 3
      string = card.split(//)
       [string[0] + string[1], string[2]]
    else  card.split(//)
    end
  end

  def find_card_in_deck rank, suit, full_deck
    full_deck.find{|card| card.rank == rank && card.suit == suit}
  end
  
  def create_hand_of_cards mode, full_deck
    if mode == 'R'
      random_hand(full_deck)
    else 
      manual_hand(full_deck)
    end 
  end

  def random_hand(full_deck, hand_size = 5)
    random_hand = []
    while random_hand.length < hand_size
      random_hand << full_deck.sample
      random_hand.uniq
    end
    Output.hand_summary(random_hand)
    random_hand
  end

  def manual_hand(full_deck)
    user_input = []
    deck_rank_suit = deck_clone_no_card_objects
    input_arr  = []
    while user_input.length < 5
      Output.request_input(user_input)
      input = gets.chomp.upcase
      if deck_rank_suit.include?(input)
        user_input << manual_hand_builder(input, full_deck)
        deck_rank_suit.delete(input)
        input_arr << input
        Output.valid_card(input, user_input)
      elsif input_arr.include?(input)
        Output.already_picked
      else
        Output.invalid_card(input) 
      end
    end
    Output.hand_summary(user_input)
    user_input
  end
  
end
