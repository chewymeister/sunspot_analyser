require './spec/spec_helper'
# require 'ostruct'

describe Locator do
  before { srand(0) }
  let(:locator) { Locator.new }
  let(:coords) { [ {x:0,y:0}, {x:0,y:1}, {x:0,y:2},
                   {x:1,y:0}, {x:1,y:1}, {x:1,y:2},
                   {x:2,y:0}, {x:2,y:1}, {x:2,y:2} ] }
  let(:sunspots) { coords.inject([]) { |set, coords| set << Sunspot.new(rand(1..5), coords) } }

  context "when neighbours have been assigned" do
    before { locator.assign_sunspot_neighbours(sunspots) }

    it "should have 5 1 4 4 as its neighbour" do
      expect(sunspots[0].neighbours).to eq [5, 1, 4, 4]
    end
    
    it "should have 1 4 4 2 as its neighbour" do
      expect(sunspots[2].neighbours).to eq [1, 4, 4, 2]
    end

    it "should have 5 1 4 4 4 2 4 3 5 as its neighbour" do
      expect(sunspots[4].neighbours).to eq [5,1,4,4,4,2,4,3,5]
    end
    
    it "should have 4 4 4 3 as its neighbour" do
      expect(sunspots[6].neighbours).to eq [4, 4, 4, 3]
    end

    it "should have 4 2 3 5 as its neighbour" do
      expect(sunspots[8].neighbours).to eq [4, 2, 3, 5]
    end
  end

end
