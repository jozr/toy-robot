require "spec_helper"

describe Right do
  let(:toy_robot) { ToyRobot.new }
  let(:right) { Right.new(toy_robot) }

  it "initializes with a toy robot" do
    expect(right.toy_robot).to eq(toy_robot)
  end

  describe "perform_and_respond!" do
    before { toy_robot.place!(1, 1, "WEST") }

    it "turns the toy robot Right" do
      expect($stdout).to receive(:puts).with("---------- Successfully turned!")
      right.perform_and_respond!
      expect(toy_robot.direction).to eq("NORTH")
    end
  end
end
