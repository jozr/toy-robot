require "spec_helper"

describe Report do
  let(:x) { 2 }
  let(:y) { 2 }
  let(:direction) { "WEST" }
  let(:toy_robot) { ToyRobot.new }
  let(:report) { Report.new(toy_robot) }

  before { toy_robot.place!(x, y, direction) }

  it "initializes with a toy robot and command text" do
    expect(report.toy_robot).to eq(toy_robot)
  end

  describe "perform_and_respond!" do
    it "reports the toy robot's position" do
      expect($stdout).to receive(:puts).with("---------- #{x},#{y},#{direction}")
      report.perform_and_respond!
    end
  end
end
