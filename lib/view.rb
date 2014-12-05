require_relative 'controller'

=begin
Pseudocode:


deck output  : array of player hand
player output: boolean bust
dealer output (need to be called) :  array of dealer hand

module TerminalInterface
extend self

if BUST occurs controller to call this function
OR
  def at_end_of_game (param = bust status? BOOLEAN )
    if  player param bust?
      puts "Bust! Dealer wins. Would you like to start a NEW GAME or  EXIT?"
      user_input = gets.chomp

      Controller.game_restart?(user_input)
    elsif dealer_busts (param = bust)
      puts "Dealer busts! YOU WIN!!!!!!!!!! Would you like to start a NEW GAME or EXIT?"
      user_input = gets.chomp
      Controller.game_restart?(user_input)
    end
-------^---------- repeated code can be refactored

  end


  def during_game(dealer_cards, player cards)
    puts "Dealer cards: [face-down card] #{dealer_cards[1]} "
    puts "Your cards: #{player cards}"
    puts "Would you like to HIT or STAY?"
    user_action = gets.chomp
    Controller.game_continue(user_action)

    if player STAYS show all of dealer cards

end



*** If have more time, implement a legend (but not necessary as suits do not matter in this game)

=end

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