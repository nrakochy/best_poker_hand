require_relative 'output'
require_relative 'card'

class Deck  	
  
  def make_deck_of_cards
    full_deck = []
    card_elements = deck_rank_suit
    card_elements.each do |element|
      x = isolate_card_components(element)
      full_deck << Card.new(x[0], x[1])
    end
    full_deck
  end

  def deck_rank_suit
    num = (2..10).to_a
    rank_values = (num.map{|num| num.to_s} + ['J', 'Q', 'K', 'A'])
    suits = ['C', 'D', 'H', 'S']
    deck = []
    suits.each{|suit| rank_values.each{|rank| deck << (rank + suit)}}
    deck
  end

  def manual_hand_builder user_input, full_deck
    card_components = isolate_card_components(user_input)
    find_card_in_deck(card_components[0],card_components[1], full_deck)
  end

  def isolate_card_components card
    card_components = card.split(//)

    if card_components.length == 3
       [card_components[0] + card_components[1], card_components[2]]
    else
      card_components
    end
  end

  def find_card_in_deck rank, suit, full_deck
    full_deck.find{|card| card.rank == rank && card.suit == suit}
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
    rank_suit = deck_rank_suit
    input_arr  = []
    while user_input.length < 5
      Output.request_input(user_input)
      input = gets.chomp.upcase
      if rank_suit.include?(input)
        user_input << manual_hand_builder(input, full_deck)
        rank_suit.delete(input)
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
