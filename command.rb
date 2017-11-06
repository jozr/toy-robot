class Command
  attr_reader :text, :error_messages, :first, :x, :y, :direction

  def initialize(text, first=false)
    @text = text
    @first = first
    @error_messages = []
  end

  def validate!
    if first || text.include?("PLACE")
      validate_placing!
    else
      error_messages << unrecognized_order_msg unless ["MOVE", "RIGHT", "LEFT", "REPORT"].any? { |ro| ro == text }
    end
  end

  private

  def validate_placing!
    error_messages << improper_formatting_msg unless /PLACE [0-9],[0-9],[(NORTH|SOUTH|EAST|WEST)]/.match(text)
  end

  def improper_formatting_msg
    "The PLACE command needs to be in the following format - PLACE x,y,DIRECTION - " \
      "where x and y are positive integers and the direction is either NORTH, SOUTH, EAST, or WEST."
  end

  def unrecognized_order_msg
    "That's not a proper command."
  end
end
