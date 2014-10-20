require 'spec_helper'

describe ChooseMode do
  
  it 'returns true for valid user input to choose game mode' do
    input = 'R'
    expect(ChooseMode.new.valid?(input)).to eq(true)
  end

  it 'returns false for invalid mode choice' do
    input = 'X'
    expect(ChooseMode.new.valid?(input)).to eq(false)
  end

end
