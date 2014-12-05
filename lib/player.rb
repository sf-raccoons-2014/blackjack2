require_relative 'deck'

class Player

  attr_reader :hand

  def initialize(deck)
    @hand = []
    @deck = deck
  end

  def get_hand
    2.times {draw_card}
  end

  def draw_card
    @hand << @deck.draw
  end

  def total
    @hand.map{|card| card.value}.inject(:+)
  end

  def bust?
    return false if total < 21
    return true unless has_ace?
    eleven_to_one
    return false
  end

private

  def eleven_to_one
    @hand[@hand.map{|card| card.value}.index(11)].value
    @hand[@hand.map{|card| card.value}.index(11)].value = 1
  end

  def has_ace?
    @hand.map{|card| card.value}.include?(11)
  end
end

