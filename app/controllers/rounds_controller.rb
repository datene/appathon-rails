class RoundsController < ApplicationController
    skip_before_action :authenticate_user!

  def show
    @round = Round.find(params[:id])
    @player_one = @round.player_one
    @player_two = @round.player_two
    @product_image_player_one = Api.new.searcher(random_keyword)
    @product_image_player_two = Api.new.searcher(random_keyword)
    @game = Game.find(params[:game_id])
  end

  private

  def random_keyword
    [
      "hello", 
      "goodbye", 
      "explosion", 
      "water", 
      "kittens", 
      "puppies", 
      "rabbits", 
      "rock", 
      "implosion"
      ].sample
  end
end
