require_relative '../table'

class Place
  attr_reader :toy_robot, :command_text

  def initialize(toy_robot, command_text)
    @toy_robot    = toy_robot
    @command_text = command_text
  end

  def perform_and_respond!
    if table.valid_position?(x, y)  
      toy_robot.place!(x, y, direction)
      puts "---------- Successfully placed!"
    else
      puts "---------- Not that far!"
    end
  end

  private

  def x
    @x ||= positions[0].to_i
  end

  def y
    @y ||= positions[1].to_i
  end

  def direction
    @direction ||= positions[2]
  end

  def positions
    @positions ||= begin
      command_text.slice!("PLACE ")
      command_text.split(",")
    end
  end

  def table
    @table ||= Table.new
  end
end
