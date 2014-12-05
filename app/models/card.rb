require_relative '../../config/application'

class Card < ActiveRecord::Base

  def self.draw
    card = Card.where('played = "false"').offset(rand(Card.count)).first
    card.used = true
    card
  end

end
