class Table
  attr_reader :height, :width

  def initialize
    @height = 5
    @width = 5
  end

  def valid_position?(x, y)
    x.between?(0, width_limit) && y.between?(0, height_limit)
  end

  private

  def height_limit
    zero_based(height)
  end

  def width_limit
    zero_based(width)
  end

  def zero_based(dimension)
    dimension - 1 # given that [0,0] is a valid position
  end
end
