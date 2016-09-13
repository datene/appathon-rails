class GamesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
    @attempt = Attempt.new
    if @game.users.count >= 2
      @round = Round.new
      pick_players
      @round.game = @game
      if @round.save
        redirect_to game_round_path(@game,@round)
      else
        flash[:notice] = "Something went wrong"
      end
    else
      flash[:notice] = "Waiting for players"
    end
  end

  def vote
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end

  def pick_players
    @round.player_one = @game.users[rand(0...@game.users.count)]
    @round.player_two = @game.users[rand(0...@game.users.count)]
    if @round.player_one == @round.player_two
      pick_players
    end
  end
end
