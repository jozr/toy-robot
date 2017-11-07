class Report
  attr_reader :toy_robot

  def initialize(toy_robot)
    @toy_robot = toy_robot
  end

  def perform_and_respond!
    puts "---------- #{toy_robot.position}"
  end
end
