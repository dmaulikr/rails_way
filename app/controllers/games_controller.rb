class GamesController < ApplicationController
  before_action :set_time, only: :show

  def index
    session[:current_level] ||= 1
  end

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
      current_level = game_params[:level].to_i.next

      session[:current_level] = current_level
      session.delete(:railroad)

      redirect_to game_path(level: current_level)
    else
      @blocks = session[:railroad]['blocks'].map(&:symbolize_keys)
      render :show
    end
  end

  private

  def dimensions
    [2, 2]
  end

  def set_time
    @time = case game_params[:level].to_i
            when 1 then 20
            when 2 then 15
            when 3 then 10
            when 4 then 8
            else        5
            end
  end

  def game_params
    params.permit(:level)
  end
end
