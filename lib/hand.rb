class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    return false if @cards.count >= 5
    @cards << card
    true
  end

  def discard_card(card_number)
    return false if @cards.count == 0
    @cards.delete_at(card_number)
    true
  end

end