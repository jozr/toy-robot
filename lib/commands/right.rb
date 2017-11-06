class Right
  attr_reader :toy_robot

  def initialize(toy_robot)
    @toy_robot = toy_robot
  end

  def perform_and_respond!
    toy_robot.right!
    puts "---------- Successfully turned!"
  end
end
