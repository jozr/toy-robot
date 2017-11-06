require_relative "toy_robot"

Dir[File.join(File.dirname(__FILE__), "commands/*.rb")].each do |file|
  require file
end

class Director
  attr_accessor :toy_robot

  def input
    puts "---------- Enter a command."
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
      else
        klass = Module.const_get(command_text.capitalize)
        klass.new(toy_robot).perform_and_respond!
      end
    else
      puts command.error_messages.first
    end
  end

  def handle_placing(command_text)
    command = CommandValidator.new(command_text, place=true)
    command.validate!

    if command.error_messages.empty?
      Place.new(toy_robot, command_text).perform_and_respond!
    else
      puts command.error_messages.first
    end
  end

  def toy_robot
    @toy_robot ||= ToyRobot.new
  end
end
