class AttemptsController < ApplicationController
  before_action :set_game

  def create
    @attempt = Attempt.new(attempt_params)
    @attempt.user = current_user
    @attempt.game = @game
    if @attempt.save
      respond_to do |format|
        format.html { redirect_to game_path(@game) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'games/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def attempt_params
    result = params.require(:attempt).permit(:content)
    result[:content] = Api.new.searcher(result[:content])
    result
  end

end
