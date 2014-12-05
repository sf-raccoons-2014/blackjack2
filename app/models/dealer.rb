require_relative '../../config/application'

class Dealer < ActiveRecord::Base

  attr_reader :hand

  def get_hand
    @hand = []
    2.times { @hand << Card.draw }
  end

  def play_hand
    until bust? || stay?
      @hand << Card.draw
    end
  end

  def stay?
    total >= 17
  end

  def bust?
    change_ace!
    total > 21
  end

  def change_ace!
    if total > 21
      @hand.each do |card|
        card.value = '1' if card.value == 'A'
      end
    end
  end

  def total
    total = 0
    @hand.map{|card| card.value}
    .each do |card_value|
      if ['J', 'Q', 'K'].include? card_value
        total += 10
      elsif card_value == 'A'
        total += 11
      else
        total += card_value.to_i
      end
    end
    total
  end

end

dealer = Dealer.new

card1 = Card.new
card1.value = 'A'
card1.played = 'false'
card2 = Card.new
card2.value = '9'
card2.played = 'false'