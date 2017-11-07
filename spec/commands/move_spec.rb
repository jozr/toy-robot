require "spec_helper"

describe Move do
  let(:x) { 2 }
  let(:y) { 2 }
  let(:direction) { "WEST" }
  let(:toy_robot) { ToyRobot.new }
  let(:simulator) { double(move!: true, x: x, y: y) }
  let(:move) { Move.new(toy_robot) }

  before { allow(move).to receive(:simulator).and_return(simulator) }

  it "initializes with a toy robot" do
    expect(move.toy_robot).to eq(toy_robot)
  end

  describe "perform_and_respond!" do
    before { toy_robot.place!(x, y, "WEST") }

    it "moves the toy robot one dimension" do
      expect($stdout).to receive(:puts).with("---------- Along it goes...")
      move.perform_and_respond!
      expect(toy_robot.position).to eq("#{x-1},#{y},#{direction}")
    end

    context "the command is out of bounds" do
      let(:simulator) { double(move!: true, x: -1, y: y) }

      it "does not move the toy robot" do
        expect($stdout).to receive(:puts).with("---------- Not that far!")
        move.perform_and_respond!
        expect(toy_robot.position).to eq("#{x},#{y},#{direction}")
      end
    end
  end
end
