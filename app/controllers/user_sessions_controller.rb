class UserSessionsController < ApplicationController
  before_action :set_game
  def create
    @user_session = UserSession.new
    @user_session.game = @game
    @user_session.user = current_user
    if @user_session.save
      redirect_to game_path(@game)
    else
      render 'pages/home'
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

end
