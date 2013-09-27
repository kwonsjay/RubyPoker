require 'rspec'
require_relative '../lib/hand.rb'

describe Hand do
  subject(:hand) { Hand.new }

  describe "#initialize" do
    it "should start with no cards" do
      hand.cards.empty?.should == true
    end
  end

  describe "#add_card" do
    let(:card) { double }

    it "should have more cards after add_card" do
      previous_count = hand.cards.count
      hand.add_card(card)
      hand.cards.count.should > previous_count
    end

    it "should not have more than 5 cards" do
      6.times { hand.add_card(card) }
      expect(hand.cards.count).to eq(5)
    end
  end

  describe "#discard_card" do
    let(:card) { double }

    it "should have fewer cards after discard_card" do
      5.times { hand.add_card(card) }
      previous_count = hand.cards.count
      hand.discard_card(0)
      expect(hand.cards.count).to be < previous_count
    end

    it "should not discard if hand is empty" do
      expect(hand.discard_card(0)).to eq(false)
    end

  end


end