require_relative '../lib/player'

deck = Deck.new
deck.shuffle!
player = Player.new(deck)

class Player
  attr_accessor :hand
end

p player.hand.length == 0
player.get_hand
p player.hand.length == 2
player.draw_card
p player.hand.length == 3

player.hand = [5,6,8]
p player.bust? == false

player.hand = [7,7,10]
p player.bust? == true

player.hand = [11,5,6]
p player.bust? == false
p player.hand == [1,5,6]
