class Place
  attr_reader :toy_robot, :command_text

  def initialize(toy_robot, command_text)
    @toy_robot    = toy_robot
    @command_text = command_text
  end

  def perform_and_respond!
    toy_robot.place!(
      positions[0].to_i,
      positions[1].to_i,
      positions[2]
    )
    puts "---------- Successfully placed!"
  end

  private

  def positions
    command_text.slice!("PLACE ")
    command_text.split(",")
  end
end
