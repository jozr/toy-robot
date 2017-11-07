require "spec_helper"

describe Table do
  let(:table) { Table.new }

  it "initializes a width and height of 5" do
    expect(table.height).to eq(5)
    expect(table.width).to eq(5)
  end

  describe "valid_position?" do
    let(:x) { 1 }
    let(:y) { 1 }

    it "returns true" do
      expect(table.valid_position?(x, y)).to eq(true)
    end

    context "x is out of range" do
      let(:x) { -1 }

      it "returns false" do
        expect(table.valid_position?(x, y)).to eq(false)
      end
    end

    context "y is out of range" do
      let(:y) { 40 }

      it "returns false" do
        expect(table.valid_position?(x, y)).to eq(false)
      end
    end
  end
end
