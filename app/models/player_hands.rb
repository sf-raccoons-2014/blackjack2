require_relative '../../config/application'

class PlayerHands < ActiveRecord::Base
  belongs_to :player
  belongs_to :hand
end
