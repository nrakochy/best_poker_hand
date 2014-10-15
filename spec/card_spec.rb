require 'spec_helper'

describe Card do
  it 'returns an Object with assigned rank attribute' do
    two_clubs = Card.new('2', 'C')
    expect(two_clubs.rank).to eq('2')
  end
  it 'returns an Object with assigned suit attribute' do
    two_clubs = Card.new('2', 'C')
    expect(two_clubs.suit).to eq('C')
  end

end
