require_relative '../../config/application'

class Card < ActiveRecord::Base

  def self.draw
    unplayed = Card.all.where(played=false)
    card = unplayed.offset(rand(unplayed.count)).first
    card.played = true
    card
  end

end
