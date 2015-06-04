class GameMailer < ApplicationMailer
  include PlayersHelper

  def notify_turn(game_id, player_id, opponent_id)
    @game_type = GameType.find(Game.find(game_id).game_type_id)
    @player = Player.find(player_id)
    @opponent = Player.find(opponent_id)
    mail(to: @opponent.email, subject: "Now it's your turn!")
  end 

  def notify_end(game_id)
    @game = Game.find(game_id)
    @game_type = GameType.find(@game.game_type_id)
    if @game.winning_player == @game.player_1_id 
      losing_player = @game.player_2_id
    else
      losing_player = @game.player_1_id
    end
    @winner = Player.find(@game.winning_player)
    @loser = Player.find(losing_player)
    mail(to: @winner.email, subject: "You've won!")
    mail(to: @loser.email, subject: "Better luck next time")
  end

end
