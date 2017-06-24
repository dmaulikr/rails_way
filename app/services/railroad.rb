class Railroad
  def initialize(width, height)
    @width  = width
    @height = height
  end

  def available_starting_points
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
end
