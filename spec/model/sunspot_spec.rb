require './spec/spec_helper'

describe Sunspot do
  let(:sunspot) { Sunspot.new('1') }

  it "should provide its value" do
    expect(sunspot.value).to eq '1'
  end

  context "calculating sunspot value" do
    context "when given 3 neighbours" do
      before :each do
        spot_1 = double('spot_1', value: 1)
        spot_2 = double('spot_2', value: 2)
        spot_3 = double('spot_3', value: 3)
        neighbours = [spot_1, spot_2, spot_3]
        sunspot.receive(neighbours)
      end

      it "should have a sunspot value of 7" do
        expect(sunspot.sunspot_value).to eq '7'
      end
    end

    context "when given 8 neighbours" do
      before :each do
        spot_1 = double('spot_1', value: 1)
        spot_2 = double('spot_2', value: 2)
        spot_3 = double('spot_3', value: 3)
        spot_4 = double('spot_4', value: 4)
        spot_5 = double('spot_5', value: 5)
        spot_6 = double('spot_6', value: 6)
        spot_7 = double('spot_7', value: 7)
        spot_8 = double('spot_8', value: 8)
        neighbours = [spot_1, spot_2, spot_3, spot_4, spot_5, spot_6, spot_7, spot_8]
        sunspot.receive neighbours
      end

      it "should have a sunspot value of 37" do
        expect(sunspot.sunspot_value).to eq '37'
      end
    end
  end
end
