require "spec_helper"

describe CommandValidator do
  let(:text) { "PLACE 1,2,WEST" }
  let(:command_validator) { CommandValidator.new(text) }

  describe "initialize" do
    it "contains text" do
      expect(command_validator.text).to eq(text)
    end

    it "contains a false 'place' boolean" do
      expect(command_validator.place).to eq(false)
    end

    context "with a 'place' argument" do
      let(:place) { true }
      let(:command_validator) { CommandValidator.new(text, place) }

      it "contains a 'place' boolean" do
        expect(command_validator.place).to eq(place)
      end
    end

    it "contains an empty error messages array" do
      expect(command_validator.error_messages).to eq([])
    end
  end

  describe "validate!" do
    before { command_validator.validate! }

    context "'place' argument is true" do
      let(:place) { true } 
      let(:command_validator) { CommandValidator.new(text, place) }

      it "finds no errors" do
        expect(command_validator.error_messages).to eq([])
      end

      context "text does not include PLACE" do
        let(:text) { "MOVE" }

        it "finds an error" do
          expect(command_validator.error_messages).to eq([
            "The PLACE command needs to be in the following format - PLACE x,y,DIRECTION - where x and y are positive integers and the direction is either NORTH, SOUTH, EAST, or WEST."
          ])
        end
      end
    end

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
