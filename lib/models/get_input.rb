class GetInput

  def create_deck
    num = (2..10).to_a
    rank_deck = (num.map{|num| num.to_s} + ['J', 'Q', 'K', 'A'])
    suits = ['S', 'H', 'D', 'C']
    deck = []
    rank_deck.map {|rank| suits.each{|suit| deck << rank + suit}}
    deck
  end

  def get_input
    user_input = []
    deck = create_deck
    while user_input.length < 5
     puts "Please enter card ##{user_input.length + 1} to find highest value of of your poker hand \n   Please use this format- 2H (as an example of the 2 of hearts)\n   Your options are 2-10, J(for Jack), Q(for Queen), K(for King), and A(for Ace)\n   You can choose from H(for Hearts), D(for Diamonds), S(for Spades), and C(for clubs)"
     input = gets.chomp.upcase
     if deck.include?(input)
       user_input << input
       deck.delete(input)
       puts "You chose #{input} for card ##{user_input.length}"
       deck
     elsif user_input.include?(input)
       puts "You already picked that card. Please choose another one."
     else 
        puts "Sorry. Try again. You need to choose a valid card."
     end
    end
    puts "Here's what your hand looks like:"
    user_input.each_with_index{|card, index| puts "You chose #{card} for card##{index + 1}"}
    user_input
  end
end
