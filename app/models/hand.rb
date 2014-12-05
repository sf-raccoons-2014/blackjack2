require_relative '../../config/application'

class Hand < ActiveRecord::Base
  has_many :player_hands
end
