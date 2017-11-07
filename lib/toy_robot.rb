class ToyRobot
  attr_reader :x, :y, :direction

  def place!(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def move!
    case direction
    when "NORTH" then @y += 1
    when "SOUTH" then @y -= 1
    when "EAST"  then @x += 1
    when "WEST"  then @x -= 1
    end
  end

  def left!
    index = directions.index(direction)
    @direction = directions[(index - 1) % directions.length]
  end

  def right!
    index = directions.index(direction)
    @direction = directions[(index + 1) % directions.length]
  end

  def position
    "#{x},#{y},#{direction}"
  end

  def placed?
    !!(x && y && direction)
  end

  private

  def directions
    ["NORTH", "EAST", "SOUTH", "WEST"]
  end
end
