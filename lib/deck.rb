require_relative './card.rb'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    build_deck
    shuffle
  end

  def build_deck
    [:spade, :club, :heart, :diamond].each do |suit|
      build_suit(suit)
    end
  end

  def build_suit(suit)
    (2..14).each do |value|
      @cards << Card.new(value, suit)
    end
  end

  def shuffle
    sample_index = rand(@cards.length) + 1
    shuffled = [@cards.delete_at(sample_index)]
    until @cards.empty?
      shuffled << @cards.delete_at(rand(@cards.length))
    end
    @cards = shuffled
    self
  end

  def dup
    new_deck = Deck.new
    new_deck.cards = @cards.dup
    new_deck
  end

  def deal_card
    @cards.pop unless @cards.empty?
  end

end