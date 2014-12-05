require_relative '../lib/dealer'
require_relative '../lib/deck'

deck = Deck.new
deck.shuffle!

class Dealer
  attr_accessor :hand
end

dealer = Dealer.new(deck)

dealer.get_hand
dealer.hand = [Card.new(value: 8, suit: ""), Card.new(value: 10, suit: "")]
p dealer.bust? == false
p dealer.stay? == true

dealer.hand = [Card.new(value: 4, suit: ""), Card.new(value: 10, suit: "")]
p dealer.bust? == false
p dealer.stay? == false

dealer.hand = [Card.new(value: 8, suit: ""), Card.new(value: 10, suit: ""), Card.new(value: 9, suit: "")]
p dealer.bust? == true
p dealer.stay? == true

dealer.hand = [Card.new(value: 3, suit: ""), Card.new(value: 9, suit: "")]
dealer.play_hand
p dealer.bust? == true || dealer.stay? == true

dealer.hand = [Card.new(value: 11, suit: ""), Card.new(value: 10, suit: ""), Card.new(value: 8, suit: "")]
dealer.play_hand
p dealer.bust? == false

dealer.hand = [Card.new(value: 11, suit: ""), Card.new(value: 2, suit: ""), Card.new(value: 9, suit: ""), Card.new(value: 10, suit: "")]
dealer.play_hand
p dealer.bust? == true

dealer.hand = [Card.new(value: 11, suit: ""), Card.new(value: 9, suit: ""), Card.new(value: 8, suit: "")]
dealer.play_hand
p dealer.bust? == false
p dealer.stay? == true

dealer.hand = [Card.new(value: 11, suit: ""), Card.new(value: 11, suit: "")]
dealer.play_hand
p dealer.bust? == true || dealer.stay? == true