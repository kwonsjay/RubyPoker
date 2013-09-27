require 'rspec'
require_relative '../lib/card.rb'

describe Card do
  subject(:card) { Card.new }

  describe "#initialize" do
    it "should initialize with a suit and value" do
      card.suit.should == :spade && card.value.should == 14
    end
  end

  describe "#to_s" do
    it "should give a string representation of itself" do
      card.to_s.should == "A\u2660"
    end
  end
end
