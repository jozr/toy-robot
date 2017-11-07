require "spec_helper"

describe Director do
  let(:placed) { true }
  let(:toy_robot) { instance_double(ToyRobot, placed?: placed) }
  let(:command_text) { "foo" }
  let(:director) { Director.new }

  before { allow(director).to receive(:toy_robot).and_return(toy_robot) }

  describe "command" do
    it "validates and handles non-placing order" do
      expect_any_instance_of(CommandValidator).to receive(:validate_non_placing!)
      expect(director).to receive(:handle_non_placing)
      director.command(command_text)
    end

    context "text includes PLACE" do
      let(:command_text) { "PLACE 1,2,WEST" }

      it "validates and handles placing the toy robot" do
        expect_any_instance_of(CommandValidator).to receive(:validate_placing!)
        expect(director).to receive(:handle_placing)
        director.command(command_text)
      end
    end

    context "the robot is not placed yet" do
      let(:command_text) { "PLACE 1,2,WEST" }

      it "validates and handles placing the toy robot" do
        expect_any_instance_of(CommandValidator).to receive(:validate_placing!)
        expect(director).to receive(:handle_placing)
        director.command(command_text)
      end
    end
  end
end
