require "./toy_robot"

describe ToyRobot do
  let(:toy_robot) { ToyRobot.new }
  let(:x) { 2 }
  let(:y) { 2 }
  let(:direction) { "NORTH" }

  it "initializes" do
  end

  describe "place!" do
    before { toy_robot.place!(x, y, direction) }

    it "sets the position and direction" do
      expect(toy_robot.x).to eq(x)
      expect(toy_robot.y).to eq(y)
      expect(toy_robot.direction).to eq(direction)
    end
  end

  describe "move!" do
    before { toy_robot.place!(x, y, direction) }

    context "direction is NORTH" do
      let(:direction) { "NORTH" }

      it "increases y by 1" do
        toy_robot.move!
        expect(toy_robot.y).to eq(y+1)
      end
    end

    context "direction is SOUTH" do
      let(:direction) { "SOUTH" }

      it "decreases the y by 1" do
        toy_robot.move!
        expect(toy_robot.y).to eq(y-1)
      end
    end

    context "direction is EAST" do
      let(:direction) { "EAST" }

      it "increases x by 1" do
        toy_robot.move!
        expect(toy_robot.x).to eq(x+1)
      end
    end

    context "direction is WEST" do
      let(:direction) { "WEST" }

      it "decreases the x by 1" do
        toy_robot.move!
        expect(toy_robot.x).to eq(x-1)
      end
    end
  end

  describe "left!" do
    before { toy_robot.place!(x, y, direction) }

    context "direction is NORTH" do
      let(:direction) { "NORTH" }

      it "turns WEST" do
        toy_robot.left!
        expect(toy_robot.direction).to eq("WEST")
      end
    end

    context "direction is SOUTH" do
      let(:direction) { "SOUTH" }

      it "turns EAST" do
        toy_robot.left!
        expect(toy_robot.direction).to eq("EAST")
      end
    end

    context "direction is EAST" do
      let(:direction) { "EAST" }

      it "turns NORTH" do
        toy_robot.left!
        expect(toy_robot.direction).to eq("NORTH")
      end
    end

    context "direction is WEST" do
      let(:direction) { "WEST" }

      it "turns SOUTH" do
        toy_robot.left!
        expect(toy_robot.direction).to eq("SOUTH")
      end
    end
  end

  describe "right!" do
    before { toy_robot.place!(x, y, direction) }

    context "direction is NORTH" do
      let(:direction) { "NORTH" }

      it "turns EAST" do
        toy_robot.right!
        expect(toy_robot.direction).to eq("EAST")
      end
    end

    context "direction is SOUTH" do
      let(:direction) { "SOUTH" }

      it "turns WEST" do
        toy_robot.right!
        expect(toy_robot.direction).to eq("WEST")
      end
    end

    context "direction is EAST" do
      let(:direction) { "EAST" }

      it "turns SOUTH" do
        toy_robot.right!
        expect(toy_robot.direction).to eq("SOUTH")
      end
    end

    context "direction is WEST" do
      let(:direction) { "WEST" }

      it "turns NORTH" do
        toy_robot.right!
        expect(toy_robot.direction).to eq("NORTH")
      end
    end
  end

  describe "position" do
    before { toy_robot.place!(x, y, direction) }

    it "outputs the position and direction" do
      expect(toy_robot.position).to eq("#{x},#{y},#{direction}")
    end
  end

  describe "placed?" do
    context "coordinates and direction are set" do
      before { toy_robot.place!(x, y, direction) }

      it "returns true" do
        expect(toy_robot.placed?).to eq(true)
      end
    end

    context "x is not set" do
      before { toy_robot.place!(nil, y, direction) }

      it "returns false" do
        expect(toy_robot.placed?).to eq(false)
      end   
    end

    context "y is not set" do
      before { toy_robot.place!(x, nil, direction) }

      it "returns false" do
        expect(toy_robot.placed?).to eq(false)
      end   
    end

    context "direction is not set" do
      before { toy_robot.place!(x, y, nil) }

      it "returns false" do
        expect(toy_robot.placed?).to eq(false)
      end   
    end
  end
end
