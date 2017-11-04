class Table
  attr_reader :height, :width

  def initialize
    @height = 5
    @width = 5
  end

  def valid_position?(x, y)
  	x.between?(0, zero_based(width)) && y.between?(0, zero_based(height))
  end

  private

  def zero_based(limit)
    limit - 1 # given that 0 is a valid position
  end
end
