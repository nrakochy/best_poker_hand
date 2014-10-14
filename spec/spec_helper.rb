require 'rubygems'
require 'factory_girl'

require_relative '../lib/models/best_poker_hand'
require_relative '../lib/models/hand_maker'
require_relative '../lib/models/card'

RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
end
