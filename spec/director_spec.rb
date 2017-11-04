require "./director"

describe Director do
  let(:director) { Director.new }

  it "initializes" do
  end

  describe "command" do

    it "places the toy robot" do
      expect(director.command("PLACE 1,2,WEST")).to eq("great")
    end

  end
end
