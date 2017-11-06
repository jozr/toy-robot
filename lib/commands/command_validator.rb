class CommandValidator
  attr_reader :text, :error_messages, :place

  def initialize(text, place=false)
    @text = text
    @place = place
    @error_messages = []
  end

  def validate!
    if place
      validate_placing!
    else
      validate_other_orders!
    end
  end

  private

  def validate_placing!
    return if /PLACE [0-9],[0-9],[(NORTH|SOUTH|EAST|WEST)]/.match(text)

    error_messages << improper_formatting_msg
  end

  def validate_other_orders!
    return if ["MOVE", "RIGHT", "LEFT", "REPORT"].any? { |ro| ro == text }

    error_messages << unrecognized_order_msg    
  end

  def improper_formatting_msg
    "The PLACE command needs to be in the following format - PLACE x,y,DIRECTION - " \
      "where x and y are positive integers and the direction is either NORTH, SOUTH, EAST, or WEST."
  end

  def unrecognized_order_msg
    "That's not a proper command."
  end
end
