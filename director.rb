class Director
  VALID_DIRECTIONS = ["WEST", "EAST", "NORTH", "SOUTH"]

  def initialize
  end

  def command(command)
    if initial_command?(command)
      "great"
    else
      "The initial command needs to be in the following form - PLACE x,y,DIRECTION"
    end
  end

  private

  def initial_command?(command)
    /PLACE [0-9],[0-9],[A-Z]+/.match(command)
  end

  def toy_robot(x, y, direction)
    @toy_robot ||= ToyRobot.new(x, y, direction)
  end

  def table
    @table ||= Table.new
  end
end
