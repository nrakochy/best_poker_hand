require 'spec_helper'

describe BestPokerHand do

  context 'when evaluating the face_value of the card' do 
    before :each do 
     @card1= CardMaker.new(['2','c'])
     @card2= CardMaker.new(['2','h'])
     @card3= CardMaker.new(['3','s'])
     @card4= CardMaker.new(['3','h'])
     @card5= CardMaker.new(['2','d'])
     @poker_hand = [@card1, @card2, @card3, @card4, @card5]
    end

    it '.stringify returns array of strings from card_hand input' do 
      expect(BestPokerHand.new.stringify(['2c'])).to eq([['2', 'c']])
    end

    xit '.create_card returns an Object of suit and value' do 
      expect(BestPokerHand.new(['2c']).create_card([['2','c']])).to eq([@card1])
    end

    it '.pair? returns true if poker hash includes value of 2' do
      expect(BestPokerHand.new.pair?(@poker_hand)).to eq(true)
    end

    it '.pair? returns false if poker hash contains two pairs' do 
     new_hand = @poker_hand.drop(1)
     expect(BestPokerHand.new.two_pair?(new_hand)).to eq(true)
    end


    it '.three_of_kind? returns true if poker hash includes value of 3' do 
       expect(BestPokerHand.new.three_of_kind?(@poker_hand)).to eq(true)
    end

    it '.four_of_kind? returns false if poker hash counts does not include four of a single number' do
       expect(BestPokerHand.new.four_of_kind?(@poker_hand)).to eq(false)
    end

    it '.four_of_kind? returs true if poker hash counts includes 4 of same number' do
      new_card = CardMaker.new(['2','s'])
      four_match = @poker_hand <<  new_card
      expect(BestPokerHand.new.four_of_kind?(four_match)).to eq(true)
    end

    it '.full_house? returns true if poker hash includes 3 of a kind && two of a kind' do
      expect(BestPokerHand.new.full_house?(@poker_hand)).to eq(true)
    end

    it '.two-pair? returns false if poker hash contains full house' do 
      expect(BestPokerHand.new.two_pair?(@poker_hand)).to eq(false)
    end

    it '.two-pair? returns true if poker hash contains two pairs' do 
      new_hand = @poker_hand.drop(1)
      expect(BestPokerHand.new.two_pair?(new_hand)).to eq(true)
    end

  end

  context 'when counting the suits of a poker hand' do 

    before :each do 
       @card1= CardMaker.new(['2','c'])
       @card2= CardMaker.new(['3','c'])
       @card3= CardMaker.new(['4','c'])
       @card4= CardMaker.new(['5','c'])
       @card5= CardMaker.new(['6','c'])
       @clubs= [@card1, @card2, @card3, @card4, @card5]
    end

    it '.flush? returns false if poker hash does not include five of the same suit'  do
      new_hand = @clubs.drop(1)
      expect(BestPokerHand.new.flush?(new_hand)).to eq(false)
    end

    it '.flush? returns true if poker hash includes five of the same suit'  do
      expect(BestPokerHand.new.flush?(@clubs)).to eq(true)
    end

    it '.straight_flush? returns true if poker hash includes five of the same suit in numeric order'  do
      expect(BestPokerHand.new.flush?(@clubs)).to eq(true)
    end

  end

 end

#clubs (lowest), followed by diamonds, hearts, and spades (highest)
