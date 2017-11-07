require "spec_helper"

describe CommandValidator do
  let(:text) { "PLACE 1,2,WEST" }
  let(:command_validator) { CommandValidator.new(text) }

  it "initializes with text and an empty error messages array" do
    expect(command_validator.text).to eq(text)
    expect(command_validator.error_messages).to eq([])
  end

  describe "validate_placing!" do
    before { command_validator.validate_placing! }

    it "finds no errors" do
      expect(command_validator.error_messages).to eq([])
    end

    context "text does not include PLACE" do
      let(:text) { "MOVE" }

      it "finds an error" do
        expect(command_validator.error_messages).to eq([
          "---------- The PLACE command needs to be in the following format - PLACE x,y,DIRECTION."
        ])
      end
    end
  end

  describe "validate_non_placing!" do
    before { command_validator.validate_non_placing! }

    context "MOVE" do
      let(:text) { "MOVE" }

      it "finds no errors" do
        expect(command_validator.error_messages).to eq([])
      end
    end

    context "LEFT" do
      let(:text) { "LEFT" }

      it "finds no errors" do
        expect(command_validator.error_messages).to eq([])
      end
    end

    context "RIGHT" do
      let(:text) { "RIGHT" }

      it "finds no errors" do
        expect(command_validator.error_messages).to eq([])
      end
    end

    context "REPORT" do
      let(:text) { "REPORT" }

      it "finds no errors" do
        expect(command_validator.error_messages).to eq([])
      end
    end
  end
end
