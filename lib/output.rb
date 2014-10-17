class Output
  
  def self.welcome
    puts "Welcome to Know Your Best Poker Hand\nIf you would like to see the best rank for your own poker hand, enter M for manual mode.\nOtherwise, enter R for a randomnly generated hand."
  end
  
  def self.invalid_mode
    puts "Oops. There seems to be a mistake. You need to choose either M to manually enter your hand or R for a random hand.\nControl C will allow you to exit the game."
  end
  
  def self.request_input(user_input)
    puts "Please enter card ##{user_input.length + 1} to find highest value of of your poker hand \n   Please use this format- 2H (as an example of the 2 of hearts)\n   Your options are 2-10, J(for Jack), Q(for Queen), K(for King), and A(for Ace)\n   You can choose from H(for Hearts), D(for Diamonds), S(for Spades), and C(for clubs)"
  end
  
  def self.valid_card(input, user_input)
    puts "You chose #{input} for card ##{user_input.length}"
  end
  
  def self.already_picked   
    puts "You already picked that card. Please choose another one."
  end
  
  def self.invalid_card(input)
    puts "Sorry. Try again. You need to choose a valid card."
  end
  
  def self.mode_summary(mode)
    puts "You chose #{mode} mode."
  end
    
  def self.hand_summary(poker_hand)
    puts "Here's what the hand looks like:"
    poker_hand.each_with_index{|card, index| puts "card##{index+1}: #{card.rank}#{card.suit}"}
  end
  
  def self.determined_value(rank)
    puts "Best hand = #{rank}"
  end
  
  def self.play_again 
    puts "Want to play again? Enter Y. Any other letter will end our time together."
  end
  
  def self.farewell
    puts "Until next time..."
  end
  
end
