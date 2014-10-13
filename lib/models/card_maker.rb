class CardMaker
  attr_accessor :value, :suit

  def initialize card_data
    @value = card_data[0]
    @suit = card_data[1]
  end

end

