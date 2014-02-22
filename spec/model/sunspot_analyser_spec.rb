require './spec/spec_helper'

describe SunspotAnalyser do
  let(:analyser) { SunspotAnalyser.new('342321442034112344') }
  it "should not be nil" do
    expect(analyser).not_to be_nil
  end

  context "output should have two formats" do
    context "should provide the grid delimiters" do
      it "as 4" do
        expect(analyser.delimiter).to eq '4'
      end

      it "as 5" do
        analyser = SunspotAnalyser.new('155312041132232430233210243')
        expect(analyser.delimiter).to eq '5'
      end
    end
  end

  context "on a grid of 1 x 1" do
    let(:analyser) { SunspotAnalyser.new('111') }
    it "should have output of 1" do
      expect(analyser.output).to eq [location: [0, 0], score: "1"]
    end
  end

  context "on a grid of 2 x 2" do
    let(:analyser) { SunspotAnalyser.new('222354') }
    it "should have output of 1" do
      expect(analyser.output).to eq [{ location: [0, 0], score: "14" }, { location: [0, 1], score: "14" }]
    end
  end


  
end
