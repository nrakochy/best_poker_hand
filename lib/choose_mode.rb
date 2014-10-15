require_relative 'output'

class ChooseMode

  def choose_mode
    Output.welcome
    input = gets.chomp.upcase
    
    while !valid?(input)
      Output.invalid_mode
      input = gets.chomp.upcase
    end
    
    if input == 'R'  
      poker_hand = random_hand
      hand_summary(poker_hand) 
    else 
      poker_hand = manual_hand
      hand_summary(poker_hand)
    end
  end
  
  def valid?(input)
    input == 'R' || input == 'M'
  end
  
  def random_hand(hand_size = 5)
    deck = create_deck
    random_hand = []
    hand_size.times{|rand| random_hand << deck.sample }
    random_hand
  end

  def manual_hand
    user_input = []
    deck = create_deck
    while user_input.length < 5
      Output.request_input(user_input)
      input = gets.chomp.upcase
      if deck.include?(input)
        user_input << input
        deck.delete(input)
        Output.valid_card(input, user_input)
        deck
      elsif user_input.include?(input)
        Output.already_picked(input)
      else 
        Output.invalid_card(input) 
      end
    end
  end

  def hand_summary poker_hand
    Output.hand_summary(poker_hand)
    poker_hand
  end 

  private
  def create_deck
    num = (2..10).to_a
    rank_deck = (num.map{|num| num.to_s} + ['J', 'Q', 'K', 'A'])
    suits = ['S', 'H', 'D', 'C']
    deck = []
    rank_deck.map {|rank| suits.each{|suit| deck << rank + suit}}
    deck
  end

end
