require_relative 'card'
class DeckMaker  
	
	def make_deck_of_cards
    num = (2..10).to_a
    rank_values = (num.map{|num| num.to_s} + ['J', 'Q', 'K', 'A'])
    suits = ['C', 'D', 'H', 'S']
    
    full_deck = []
    card_id = 0
    suits.each do |suit| 
      rank_values.each do |rank|
        card_id += 1 
        full_deck << Card.new(rank,suit,card_id)
      end
    end
    full_deck
  end
	
end