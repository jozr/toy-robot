require "spec_helper"

describe Place do
  let(:toy_robot) { ToyRobot.new }
  let(:command_text) { "1,2,WEST" }
  let(:place) { Place.new(toy_robot, command_text) }

  it "initializes with a toy robot and command text" do
    expect(place.toy_robot).to eq(toy_robot)
    expect(place.command_text).to eq(command_text)
  end

  describe "perform_and_respond!" do
    it "places the toy robot on the table" do
      expect($stdout).to receive(:puts).with("---------- Successfully placed!")
      place.perform_and_respond!
      expect(toy_robot.position).to eq(command_text)
    end
  end
end
