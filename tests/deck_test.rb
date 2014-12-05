require_relative '../lib/deck'

blackjack = Deck.new
# p blackjack.deck_size
# blackjack.print_cards
blackjack.shuffle!
blackjack.print_cards
p "Blackjack deck size is 52: #{blackjack.deck_size == 52}"
p "Blackjack will return card value on draw: #{blackjack.draw.is_a?(Card)}"
p "Blackjack decrements deck: #{blackjack.deck_size == 51}"