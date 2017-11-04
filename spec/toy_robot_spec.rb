require "./toy_robot"

describe ToyRobot do
  let(:x) { "0" }
  let(:y) { "2" }
  let(:direction) { "NORTH" }
  let(:toy_robot) { ToyRobot.new(x, y, direction) }

  it "initializes with coordinates and a direction" do
    expect(toy_robot.x).to eq(x)
    expect(toy_robot.y).to eq(y)
    expect(toy_robot.direction).to eq(direction)
  end
end
