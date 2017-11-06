class Left
  attr_reader :toy_robot

  def initialize(toy_robot)
    @toy_robot = toy_robot
  end

  def perform_and_respond!
    toy_robot.left!
    puts "---------- Successfully turned!"
  end
end
