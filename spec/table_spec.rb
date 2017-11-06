require "./table"

describe Table do
  let(:table) { Table.new }

  it "initializes a width and height of 5" do
    expect(table.height).to eq(5)
    expect(table.width).to eq(5)
  end

  describe "height_limit" do
    it "returns 4" do
      expect(table.height_limit).to eq(4)
    end
  end

  describe "width_limit" do
    it "returns 4" do
      expect(table.width_limit).to eq(4)
    end
  end
end
