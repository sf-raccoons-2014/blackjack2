require_relative '../../config/application'

class Dealer < ActiveRecord::Base



end


# class Dealer
#   attr_reader :hand
#   def initialize(deck)
#     @hand = []
#     @deck = deck
#   end

#   def get_hand # TESTED AND WORKS
#     2.times { @hand << @deck.draw }
#   end

#   def play_hand # TESTED AND WORKS
#     until bust? || stay?
#       @hand << @deck.draw
#     end
#   end

#   def stay? # TESTED AND WORKS
#     total >= 17
#   end

#   def bust? # TESTED AND WORKS
#     change_ace!
#     total > 21
#   end

#   def change_ace!
#     hand = total
#     @hand.each do |card|
#       if hand > 21 && card.value == 11
#         card.value = 1
#         return
#       end
#     end
#   end

#   def total
#     @hand.inject(0) { |memo, card| memo += card.value }
#   end

# end