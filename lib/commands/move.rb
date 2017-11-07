require_relative "../table"

class Move
  attr_reader :toy_robot

  def initialize(toy_robot)
    @toy_robot = toy_robot
  end

  def perform_and_respond!
    simulator.move!

    if table.valid_position?(simulator.x, simulator.y)
      toy_robot.move!
      puts "---------- Along it goes..."
    else
      puts "---------- Not that far!"
    end
  end

  private

  def simulator
    @simulator ||= toy_robot.dup
  end

  def table
    @table ||= Table.new
  end
end
