require_relative 'output'

class ChooseMode

  def choose_mode
    Output.welcome
    input = gets.chomp.upcase
    
    while !valid?(input)
      Output.invalid_mode
      input = gets.chomp.upcase
    end
    
    mode_summary(input)
  end
  
  def valid?(input)
    input == 'R' || input == 'M'
  end

  def mode_summary mode
    Output.mode_summary(mode)
    mode
  end 

end
