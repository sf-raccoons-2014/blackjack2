
require_relative 'dealer'
require_relative 'deck'
require_relative 'player'
# p require_relative 'view'
# p "#{TerminalInterface.display_cards} run?"

# Controller Pseudocode

# Take player user input
    # HIt
        # Go back to the model to deal card and call View to show dealt card
        # Busts (>21) game ends and go to the Dealer to show dealer's down card?
    # Stay
        # Move on to the dealer's turn

# Go to the Dealer model?
    # dealer if less than 17
        #HIt, update the View to show dealt card
    # dealer >= 17 and <= 21
        # compare vs player's card, call the Model to compare
    # dealer > 21
        # dealer busts and player wins

# After dealer's turn
    # Repeat game


class Controller
    # include 'TerminalInterface'

    def initialize
        new_game
    end

    def new_game
        @deck = Deck.new
        @deck.shuffle!
        @player = Player.new(@deck)
        @dealer = Dealer.new(@deck)
        @player.get_hand
        @dealer.get_hand
        get_user_action
    end

    def get_user_action
        TerminalInterface.display_cards(@dealer.hand.map{|card| card.to_s}, @player.hand.map{|card| card.to_s})
        user_action = TerminalInterface.get_user_input
        if user_action == "hit"
            @player.draw_card
            if @player.bust?
                TerminalInterface.player_bust
            else
                get_user_action
            end
        else
            dealer_play_hand
        end
    end

    def dealer_play_hand
        @dealer.play_hand
        TerminalInterface.display_cards(@dealer.hand.map{|card| card.to_s}, @player.hand.map{|card| card.to_s})
        @dealer.bust? ? TerminalInterface.dealer_bust : check_game
    end

    def check_game
        @dealer.total >= @player.total ? TerminalInterface.dealer_wins : TerminalInterface.player_wins
    end

end

module TerminalInterface
  extend self

  def display_cards(dealer_hand, player_hand)
      puts "Dealer cards: [face-down card] #{dealer_hand[1..dealer_hand.length]} "
      puts "Your cards: #{player_hand}"
  end

  def get_user_input
      puts "Would you like to HIT or STAY?"
      user_action = gets.chomp.downcase
      unless user_action == "hit" || user_action == "stay"
        puts "Please enter correct action and try again."
        get_user_input
      else
        return user_action
      end

  end

def display_with_dealer_hand(dealer_hand, player_hand)
    puts "Dealer cards: #{dealer_hand}"
    puts "Your cards: #{player_hand}"
end

def dealer_bust
  puts "Dealer busts. YOU WIN!!!!! Would you like to PLAY again or EXIT?"
  user_input = gets.chomp.downcase
  if user_input == "play"
    return user_input
  elsif user_input == "exit"
    return nil
  else
    puts "Please type in a correct command and try again."
    dealer_bust
  end
end

def player_bust
  puts "You bust. YOU LOST!!!!! Would you like to PLAY again or EXIT?"
  user_input = gets.chomp.downcase
  if user_input == "play"
    return user_input
  elsif user_input  == "exit"
    return nil
  else
    puts "Please type in a correct command and try again."
    dealer_bust
  end
end

def player_wins
  puts "YOU WIN!!!!! Would you like to PLAY again or EXIT?"
  user_input = gets.chomp.downcase
  if user_input == "play"
    return user_input
  elsif user_input == "exit"
    return nil
  else
    puts "Please type in a correct command and try again."
    dealer_bust
  end
end

def dealer_wins
  puts "Dealer wins. YOU LOST!!!!! Would you like to PLAY again or EXIT?"
  user_input = gets.chomp.downcase
  if user_input == "play"
    return user_input
  elsif user_input  == "exit"
    return nil
  else
    puts "Please type in a correct command and try again."
    dealer_bust
  end
end

end

blackJack = Controller.new
