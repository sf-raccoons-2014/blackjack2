require_relative '../../config/application'


class Controller

  def initialize
      new_game
  end

  def new_game
      @deck = Card.all
      @deck.shuffle!
      @player = Player.create
      @dealer = Dealer.create
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



blackJack = Controller.new
