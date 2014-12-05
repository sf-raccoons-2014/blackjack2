require_relative '../../config/application'

# class Deck < ActiveRecord::Base

# end



# class Deck
#   # attr_reader :deck_size
#   def initialize
#     @card_deck = []
#     royalty = ["Queen", "King", "Jack"]
#     suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
#     suits.each{|suit|
#       (2..10).each{|card|
#         @card_deck << Card.new(value: card, suit: suit)
#       }
#       royalty.each{|title|
#         @card_deck << Card.new(rank: title, suit: suit, value: 10)
#       }
#       @card_deck << Card.new(rank: "Ace", suit: suit, value: 11)
#     }

#   end

#   def shuffle!
#     @card_deck.shuffle!
#   end

#   def deck_size
#     @deck_size = @card_deck.length
#   end

#   def draw
#     @card_deck.shift
#   end

#   def print_cards
#     @card_deck.each{|card|
#       p card.name
#     }
#   end
# end
