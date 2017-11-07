require "spec_helper"

describe Left do
  let(:toy_robot) { ToyRobot.new }
  let(:left) { Left.new(toy_robot) }

  it "initializes with a toy robot" do
    expect(left.toy_robot).to eq(toy_robot)
  end

  describe "perform_and_respond!" do
    before { toy_robot.place!(1, 1, "WEST") }

    it "turns the toy robot left" do
      expect($stdout).to receive(:puts).with("---------- Successfully turned!")
      left.perform_and_respond!
      expect(toy_robot.direction).to eq("SOUTH")
    end
  end
end
