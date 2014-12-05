require_relative '../../config/application'

class Player < ActiveRecord::Base

  has_many :hands
  has_many :hands, through: :player_hands

    def change_ace!
    hand = total
    @hand.each do |card|
      if hand > 21 && card.value == 11
        card.value = 1
        return
      end
    end
  end

  def get_hand
    @hand = []
    2.times {draw_card}
  end

  def draw_card
    @hand << Card.draw
  end

  def total
    @hand.map{|card| card.value}
    .each do |card_value|
      total = 0
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

  def bust?
    return false if total < 21
    return true unless has_ace?
    eleven_to_one
    return false
  end

end