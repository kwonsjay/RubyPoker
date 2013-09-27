require_relative '../lib/deck.rb'
require 'rspec'


describe Deck do
  subject(:deck) { Deck.new }

  describe "#Initialize" do

    it "should have 52 cards" do
      deck.cards.count.should == 52
    end

  end

end