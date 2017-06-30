class Game
  attr_reader :blocks, :entrance, :exit

  def initialize(blocks, width:, height:, entrance:, exit:)
    @blocks   = blocks
    @width    = width
    @height   = height
    @entrance = entrance
    @exit     = exit

    @difficulty_level = width * height
  end

  def correct?
    @train = update_position(entrance.last(2), entrance.first)
    @goal  = update_position(exit.last(2),     exit.first)

    move(inverted_direction(entrance.first))
  end

  private

  attr_reader :width, :height, :train, :goal, :difficulty_level

  def move(direction, step: 0)
    @train = update_position(train, direction)

    return true  if difficulty_level <= step && train == goal
    return false if train.any?(&:negative?) || train.first >= height || train.last >= width # Hits the wall

    directions = Marshal.load(Marshal.dump(blocks)).each_slice(width).to_a[train.first][train.last]
    directions.merge!(directions.invert)

    next_direction = directions[inverted_direction(direction)]

    return false if next_direction.nil? # Player loses the game because blocks don't match

    move(next_direction, step: step.next)
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
