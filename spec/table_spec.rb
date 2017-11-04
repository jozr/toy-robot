require "./table"

describe Table do
  let(:table) { Table.new }

  it "initializes a width and height of 5" do
    expect(table.height).to eq(5)
    expect(table.width).to eq(5)
  end
end
