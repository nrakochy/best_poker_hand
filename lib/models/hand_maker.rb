require_relative 'card'

class HandMaker
  
  def create_hand_of_cards hand
   hand_strings = stringify(hand)
   hand_strings.map{|card| make_card(card[0], card[1])}
  end

  def stringify card_hand
    card_hand.map{|card| card.split(//)}
  end

  def make_card rank, suit
    Card.new(rank, suit)
  end
end

=begin
def stringify card_hand
  card_hand.map{|card| .split(//)}
end

def create_card card_hand
  card_hand.map{|card| Card.new(card)}
end
=end
