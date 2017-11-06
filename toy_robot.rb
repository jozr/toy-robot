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
    case direction
    when "NORTH" then @direction = "WEST"
    when "SOUTH" then @direction = "EAST"
    when "EAST"  then @direction = "NORTH"
    when "WEST"  then @direction = "SOUTH"
    end
  end

  def right!
    case direction
    when "NORTH" then @direction = "EAST"
    when "SOUTH" then @direction = "WEST"
    when "EAST"  then @direction = "SOUTH"
    when "WEST"  then @direction = "NORTH"
    end
  end

  def report
    "Output: #{x},#{y},#{direction}"
  end

  def placed?
    !!(x && y && direction)
  end
end