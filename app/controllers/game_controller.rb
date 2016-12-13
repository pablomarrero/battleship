class GameController < ApplicationController
  def play
    @player = params[:player]
  end

end
