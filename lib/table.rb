class Table
  attr_reader :height, :width

  def initialize
    @height = 5
    @width = 5
  end

  def height_limit
    zero_based(height)
  end

  def width_limit
    zero_based(width)
  end

  private

  def zero_based(dimension)
    dimension - 1 # given that 0 is a valid position
  end
end
