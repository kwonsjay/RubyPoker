class Hand
  attr_accessor :cards, :hand_type

  HAND_CHECK_METHODS = [:royal_flush?, :straight_flush?, :four_of_a_kind?,
                        :full_house?, :flush?, :straight?, :three_of_a_kind?,
                        :two_pair?, :pair?]

  def initialize
    @cards = []
    @hand_type = Hash.new
  end

  def add_card(card)
    return false if @cards.count >= 5
    @cards << card
    @cards.sort_by! { |card| card.value }
    true
  end

  def discard_card(card_number)
    return false if @cards.count == 0
    @cards.delete_at(card_number)
    true
  end

  def find_best_cards
    best_cards = false

    HAND_CHECK_METHODS.each do |method|
      best_cards = send(method)

      unless best_cards == false
        @hand_type[:best_cards] = best_cards
        @hand_type[:type] = method.to_s.chop
        return true
      end
    end

    @hand_type[:best_cards] = [@cards.last]
    @hand_type[:type] = "high_card"
  end


  def royal_flush?
    high_card = (@cards.map { |card| card.value }).max
    straight_flush? && high_card == 14 ? @cards.dup : false
  end

  def straight_flush?
    flush? && straight? ? @cards.dup : false
  end

  def flush?
    suits = @cards.map { |card| card.suit }
    suits.uniq.length == 1 ? @cards.dup : false
  end

  def straight?
    values = @cards.map { |card| card.value }
    values.uniq!
    return false if values.count < 5
    values.last - values.first == 4 ? @cards.dup : false
  end

  def full_house?
    values = @cards.map { |card| card.value }
    type1 = values.first == values[2] && values[3] == values.last
    type2 = values.first == values[1] && values[2] == values.last
    type1 || type2 ? @cards.dup : false
  end

  def three_of_a_kind?
    vals = @cards.map { |card| card.value }
    return @cards[0..2] if vals[0] == vals[2]
    return @cards[1..3] if vals[1] == vals[3]
    return @cards[2..4] if vals[2] == vals[4]
    false
  end

  def four_of_a_kind?
    vals = @cards.map { |card| card.value }
    return @cards[0..3] if vals[0] == vals[3]
    return @cards[1..4] if vals[1] == vals[4]
    false
  end

  def two_pair?
    pairs = all_pairs
    pairs.length == 2 ? pairs.flatten : false
  end

  def pair?
    pairs = all_pairs
    pairs.length == 1 ? pairs.flatten : false
  end

  def all_pairs
    pairs = []
    cards = @cards.dup
    cards.sort_by! { |card| card.value }
    card = cards.pop
    until cards.empty?
      if card.value == cards.last.value
        two_pair << [card, cards.pop]
      end
      card = cards.pop
    end
    pairs
  end

end