require_relative 'toy_robot'
require_relative 'table'

Dir[File.join(File.dirname(__FILE__), "commands/*.rb")].each do |file|
  require file
end

class Director
  attr_accessor :toy_robot, :table

  def initialize
  end

  def input
    puts "Enter a command..."
    loop do
      command(gets.chomp.upcase)
    end
  end

  def command(command_text)
    if toy_robot.placed?
      handle_order(command_text)
    else
      handle_placing(command_text)
    end
  end

  private

  def handle_order(command_text)
    command = CommandValidator.new(command_text)
    command.validate!

    if command.error_messages.empty?
      if command_text.include?("PLACE")
        handle_placing(command_text)
      elsif command_text == "MOVE"
        simulator = toy_robot.dup
        simulator.move!
        if valid_position?(simulator.x, simulator.y)
          toy_robot.move! 
        else
          puts "Not that far!"
        end
      else
        case command_text
        when "LEFT"   then toy_robot.left!  && "Success!"
        when "RIGHT"  then toy_robot.right! && "Success!"
        when "REPORT" then puts toy_robot.position
        end
      end
    else
      puts command.error_messages.first
    end
  end

  def handle_placing(command_text)
    command = CommandValidator.new(command_text, initial=true)
    command.validate!

    if command.error_messages.empty?
      place_robot(command_text)
    else
      puts command.error_messages.first
    end
  end

  def place_robot(command_text)
    command_text.slice!("PLACE ")
    positions = command_text.split(",")

    toy_robot.place!(
      positions[0].to_i,
      positions[1].to_i,
      positions[2]
    )
  end

  def valid_position?(x, y)
    x.between?(0, table.width_limit) && y.between?(0, table.height_limit)
  end

  def toy_robot
    @toy_robot ||= ToyRobot.new
  end

  def table
    @table ||= Table.new
  end
end
