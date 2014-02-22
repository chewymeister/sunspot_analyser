require './spec/spec_helper'

describe Sunspot do
  let(:sunspot) { Sunspot.new('1') }

  it "should provide its value" do
    expect(sunspot.value).to eq '1'
  end

  context "calculating sunspot value" do

    it "should have a sunspot value of 1" do
      spot_1 = double('spot_1', value: 1)
      spot_2 = double('spot_2', value: 2)
      spot_3 = double('spot_3', value: 3)
      neighbours = [spot_1, spot_2, spot_3]
      sunspot.receive(neighbours)

      expect(sunspot.sunspot_value).to eq '7'
    end
  end
end
