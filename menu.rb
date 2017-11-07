require "./lib/director"

def welcome_command
  puts "---------- Welcome to the toy robot game."
  puts "---------- PLACE will place the toy robot on the table in the following format - PLACE x,y,DIRECTION"
  puts "---------- (where x and y are integers and the direction is NORTH, SOUTH, EAST, or WEST)."
  puts "---------- MOVE will move the robot one place in its direction."
  puts "---------- RIGHT will turn the robot right."
  puts "---------- LEFT will turn the robot left."
  puts "---------- REPORT will report the robot's position."
  puts "---------- HELP will display this helpful text."
  puts "---------- EXIT will exit this prompt."
  puts "---------- Have fun!"
end

director = Director.new
puts welcome_command
loop do
  text = gets.chomp

  case text
  when "HELP"
    puts welcome_command
  when "EXIT"
    exit
  else
    director.command(text)
  end
end
