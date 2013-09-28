require 'rspec'
require_relative '../lib/hand.rb'
require_relative '../lib/card.rb'

describe Hand do
  subject(:hand) { Hand.new }

  describe "#initialize" do
    it "should start with no cards" do
      hand.cards.empty?.should == true
    end
  end

  describe "#add_card" do
    let(:card1) { Card.new(2, :club) }

    it "should have more cards after add_card" do
      previous_count = hand.cards.count
      hand.add_card(card1)
      hand.cards.count.should > previous_count
    end

    it "should not have more than 5 cards" do
      6.times { hand.add_card(card1) }
      expect(hand.cards.count).to eq(5)
    end
  end

  describe "#discard_card" do
    let(:card1) { Card.new(2, :club) }

    it "should have fewer cards after discard_card" do
      5.times { hand.add_card(card1) }
      previous_count = hand.cards.count
      hand.discard_card(0)
      expect(hand.cards.count).to be < previous_count
    end

    it "should not discard if hand is empty" do
      expect(hand.discard_card(0)).to eq(false)
    end

  end

  describe "#find_best_cards" do
    let(:card1) { Card.new(10, :heart) }
    let(:card2) { Card.new(11, :heart) }
    let(:card3) { Card.new(12, :heart) }
    let(:card4) { Card.new(13, :heart) }
    let(:card5) { Card.new(14, :heart) }

    it "should find the best hand it can from its cards" do
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      hand.find_best_cards
      expect(hand.hand_type[:type]).to eq("royal_flush")
    end
  end


end