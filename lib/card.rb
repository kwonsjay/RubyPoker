class Card
  attr_accessor :suit, :value

  VALUES = {
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9",
    10 => "10",
    11 => "J",
    12 => "Q",
    13 => "K",
    14 => "A"
  }

  SUITS = {
    :spade => "\u2660",
    :club => "\u2663",
    :diamond => "\u2666",
    :heart => "\u2665"
  }

  def initialize(value = 14, suit = :spade)
    @suit = suit
    @value = value
  end

  def to_s
    "#{VALUES[@value]}#{SUITS[suit]}"
  end


end