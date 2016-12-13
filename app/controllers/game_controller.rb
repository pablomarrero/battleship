class GameController < ApplicationController
  before_action :set_basics, only: [:play, :start]
  def play
  end

  def start
    @game = construct_game_object
    respond_to do |format|
      if @game.save
        format.html { render :play, notice: 'Game has started!.' }
      else
        format.html { render :play }
      end
    end
  end

  private
  def set_basics
    @player = params[:player]
    if params[:game_id].blank?
      @game = Game.where('active = true').last
      if @game.nil?
        @game = Game.new
      end
    else
      @game = Game.find params[:game_id] 
    end
  end

  def construct_game_object
    game_params = set_game_params
    @game = Game.new if @game.nil?
    json = {carrier: game_params[:ships_position_carrier], battleship: game_params[:ships_position_battleship], cruiser: game_params[:ships_position_cruiser], submarine: game_params[:ships_position_submarine], destroyer: game_params[:ships_position_destroyer] }
    @game.send("player#{@player}_ships_position=", json)
    @game.send("player#{@player}=",@player)

    @game
  end

  def deconstruct_game_object
    
  end

  def set_game_params
    params.permit( :ships_position_carrier, :ships_position_battleship, :ships_position_cruiser, :ships_position_submarine, :ships_position_destroyer)
  end
end
