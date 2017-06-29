class Game
  def initialize(blocks, width:, height:, entrance:, exit:)
    @blocks = blocks
    @width  = width
    @height = height

    @entrance = entrance
    @exit     = exit
  end

  def play
    @train = update_position(entrance.last(2), entrance.first)
    @goal  = update_position(exit.last(2),     exit.first)

    move(inverted_direction(entrance.first))
  end

  private

  attr_reader :blocks, :width, :height, :entrance, :exit, :train, :goal

  def move(direction)
    @train = update_position(train, direction)

    return true  if train == goal
    return false if train.any?(&:negative?) || train.first >= height || train.last >= width # Hits the wall

    next_direction = blocks.each_slice(width)
      .to_a[train.first][train.last][inverted_direction(direction)]

    return false if next_direction.nil? # Player loses the game because blocks don't match

    move(next_direction)
  end

  def update_position(position, direction)
    [position, direction_positions(direction)].transpose.map { |array| array.inject(:+) }
  end

  def direction_positions(direction)
    {
      'U' => [-1, 0],
      'D' => [1,  0],
      'L' => [0, -1],
      'R' => [0,  1]
    }[direction]
  end

  def inverted_direction(direction)
    { 'U' => 'D', 'D' => 'U', 'L' => 'R', 'R' => 'L' }[direction]
  end
end
