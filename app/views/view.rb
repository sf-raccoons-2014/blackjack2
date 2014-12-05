require_relative '../../config/application'

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