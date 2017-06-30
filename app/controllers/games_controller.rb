class GamesController < ApplicationController
  def show
    @size = case game_params[:level]
    when '1' then [2, 2]
    end

    @game = Railroad.new(*@size).games_permutation.detect(&:correct?)
    # session[:game] = nil

    @blocks = @game.blocks.shuffle.map { |block| { image: block.flatten.join } }.each_slice(2).to_a

    @blocks[@game.entrance[1]][@game.entrance[2]].merge!(entrance: @game.entrance[0])
    @blocks[@game.exit[1]][@game.exit[2]].merge!(exit: @game.exit[0])

    @blocks.flatten!
  end

  def game_params
    params.permit(:level)
  end
end
