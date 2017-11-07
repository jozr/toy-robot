require_relative "./toy_robot"

Dir[File.join(File.dirname(__FILE__), "commands/*.rb")].each { |file| require file }

class Director
  def command(command_text)
    validator = CommandValidator.new(command_text)

    if !toy_robot.placed? || command_text.include?("PLACE")
      validator.validate_placing!
      handle_placing(command_text, validator.error_messages)
    else
      validator.validate_non_placing!
      handle_non_placing(command_text, validator.error_messages)
    end
  end

  private

  def handle_placing(text, msgs)
    bounce_error_messages(msgs) { Place.new(toy_robot, text).perform_and_respond! }
  end

  def handle_non_placing(text, msgs)
    bounce_error_messages(msgs) do
      klass = Module.const_get(text.capitalize)
      klass.new(toy_robot).perform_and_respond!
    end
  end

  def bounce_error_messages(msgs)
    if msgs.empty? 
      yield
    else
      puts msgs.first
    end
  end

  def toy_robot
    @toy_robot ||= ToyRobot.new
  end
end
