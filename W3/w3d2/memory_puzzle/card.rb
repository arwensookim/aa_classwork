class Card

  attr_reader :revealed, :hidden_card

  def initialize(card)
    @hidden_card = card
    @revealed = false
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def ==(other_card)
    return false if other_card == nil
    return true if @hidden_card == other_card.hidden_card
  end
end
