require_relative '../lib/deck.rb'
require 'rspec'


describe Deck do
  subject(:deck) { Deck.new }

  describe "#Initialize" do

    it "should have 52 cards" do
      deck.cards.count.should == 52
    end

    it "should have 52 unique cards" do
      deck.cards.map { |card| card.to_s }.uniq.count.should == 52
    end
  end

  describe "#shuffle" do
    it "shuffling the deck should change the card order" do
      deck.dup.shuffle.cards.should_not == deck.cards
    end
  end

  describe "#deal_card" do
    it "should deal a single card" do
      deck.deal_card.should_not == nil
    end

    it "should not deal a card if the deck is empty" do
      52.times { deck.deal_card }
      deck.deal_card.should == nil
    end
  end

end