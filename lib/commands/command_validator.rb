class CommandValidator
  attr_reader :text, :error_messages

  def initialize(text)
    @text = text
    @error_messages = []
  end

  def validate_placing!
    return if /PLACE [0-9],[0-9],(NORTH|SOUTH|EAST|WEST)/.match(text)

    error_messages << improper_formatting_msg
  end

  def validate_non_placing!
    return if non_placing_commands.any? { |cmd| cmd == text }

    error_messages << unrecognized_order_msg    
  end

  private

  def non_placing_commands
    ["MOVE", "RIGHT", "LEFT", "REPORT"]
  end

  def improper_formatting_msg
    "---------- The PLACE command needs to be in the following format - PLACE x,y,DIRECTION."
  end

  def unrecognized_order_msg
    "---------- That's not a proper command."
  end
end
