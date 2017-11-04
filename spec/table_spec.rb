require "./table"

describe Table do
  let(:table) { Table.new }

  it "initializes a width and height of 5" do
    expect(table.height).to eq(5)
    expect(table.width).to eq(5)
  end

  describe "valid_position?" do
    it "returns true if both integers are less than 5" do
      expect(table.valid_position?(4, 4)).to eq(true)
    end

    it "returns false if x is an integer greater than 4" do
      expect(table.valid_position?(5, 4)).to eq(false)
    end

    it "returns false if y is an integer greater than 4" do
      expect(table.valid_position?(4, 5)).to eq(false)
    end
  end
end
