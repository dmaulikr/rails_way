class Game
  def initialize(blocks, width:, entrance_position:, exit_position:)
    @blocks = blocks
    @width  = width

    @entrance_position = entrance_position
    @exit_position     = exit_position
  end

  def play
    @exit_direction     = exit_position.shift
    @entrance_direction = entrance_position.shift

    @train = update_position(entrance_position, entrance_direction)
    @goal  = update_position(exit_position,     exit_direction)

    move(inverted_direction(entrance_direction))
  end

  private

  attr_reader :blocks, :width, :entrance_position, :exit_position,
    :entrance_direction, :exit_direction, :train, :goal

  def move(direction)
    @train = update_position(train, direction)

    return true  if train == goal
    return false if train.any?(&:negative?) # Hitted the wall

    next_direction = blocks.each_slice(width)
      .to_a[train.first][train.last][inverted_direction(direction)]

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

  # def number_of_solutions(game)
  # end
  #
  # def correct?(game)
  #   game = { entrance_position: ['U', 0, 0], exit_position: ['D', 1, 0], block: ['ULRD', 'ULRD', 'ULRD', 'ULRD'] }
  # end
end
