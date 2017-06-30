class GamesController < ApplicationController
  def show
    railroad = Railroad.new(*dimensions)
    railroad.prepare!

    @blocks = railroad.blocks

    session[:railroad] = {
      blocks:   @blocks,
      entrance: railroad.game.entrance,
      exit:     railroad.game.exit
    }
  end

  def check
    blocks = JSON.parse(params[:blocks_positions]).map do |block_position|
      Hash[block_position.chars.each_slice(2).to_a]
    end

    game = Game.new(blocks, width: dimensions.first, height: dimensions.last,
      entrance: session[:railroad]['entrance'], exit: session[:railroad]['exit'])

    if game.correct?
      session.delete(:railroad)
      redirect_to game_path(level: game_params[:level].to_i.next)
    else
      @blocks = session[:railroad]['blocks'].map(&:symbolize_keys)
      render :show
    end
  end

  private

  def dimensions
    [2, 2]
  end

  def game_params
    params.permit(:level)
  end
end
