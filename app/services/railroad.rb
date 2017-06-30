class Railroad
  attr_reader :width, :height, :game, :blocks

  def initialize(width, height)
    @width  = width
    @height = height
  end

  def prepare!
    prepare_game!
    prepare_blocks!
  end

  def prepare_game!
    @game = games_permutation.detect { |game| game.correct?(generating: true) }
  end

  def prepare_blocks!
    @blocks = game.blocks.shuffle.map { |block| { image: block.flatten.join } }.each_slice(2).to_a

    @blocks[game.entrance[1]][game.entrance[2]].merge!(entrance: game.entrance[0])
    @blocks[game.exit[1]][game.exit[2]].merge!(exit: game.exit[0])

    @blocks.flatten!
  end

  def games_permutation
    blocks_permutation.each_with_object([]) do |blocks, games|
      available_entrance_and_exit_positions.permutation(2).each do |entrance, exit|
        games << Game.new(blocks, width: @width, height: @height, entrance: entrance, exit: exit)
      end
    end.shuffle
  end

  def blocks_permutation
    block_images.repeated_permutation(@width * @height).to_a
  end

  def available_entrance_and_exit_positions
    [].tap do |results|
      @width.times do |index|
        results << ['U', 0,           index]
        results << ['D', @height - 1, index]
      end

      @height.times do |index|
        results << ['L', index, 0]
        results << ['R', index, @width - 1]
      end
    end
  end

  private

  def block_images
    Dir[Rails.root.join 'app/assets/images/railsroads/*'].shuffle.map do |file_path|
      Hash[file_path[/.*\/(.+).jpg/, 1].chars.each_slice(2).to_a]
    end
  end
end
