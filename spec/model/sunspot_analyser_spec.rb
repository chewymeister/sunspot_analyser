require './spec/spec_helper'

describe SunspotAnalyser do
  context "on a 1 x 1 grid" do
    let(:analyser) { SunspotAnalyser.new('111') }
    it "should have score of 1" do
      expect(analyser.output).to eq([ [ [0, 0], score: "1" ] ])
    end
  end

  context "on a 2 x 2 grid" do
    let(:analyser) { SunspotAnalyser.new('222354') }
    it "should have scores of 14, 14" do
      expect(analyser.output).to eq([ [ [1, 1], score: "14" ],
                                      [ [0, 1], score: "14" ] ])
    end
  end

  context "on a 3 x 3 grid" do
    let(:analyser) { SunspotAnalyser.new('23432525433') }
    it "should have scores of 31, 22" do
      expect(analyser.output).to eq([ [ [1, 1], score: "31" ],
                                      [ [1, 2], score: "22" ] ])
    end
  end

  context "on a 4 x 4 grid" do
    let(:analyser) { SunspotAnalyser.new('343125455232541043') }
    it "should have scores of 31, 30, 30" do
      expect(analyser.output).to eq([ [ [2, 1], score: "31" ],
                                      [ [1, 1], score: "30" ],
                                      [ [2, 2], score: "30" ] ])
    end
  end

  context "on a 5 x 5 grid" do
    let(:analyser) { SunspotAnalyser.new('353412322311050234023205000') }
    it "should have scores of 20, 20, 18" do
      expect(analyser.output).to eq([ [ [1, 1], score: "20" ],
                                      [ [2, 1], score: "20" ],
                                      [ [1, 2], score: "18" ] ])
    end
  end

  context "test data" do
    it "should have a score of 26" do
      analyser = SunspotAnalyser.new('155312041132232430233210243') 
      expect(analyser.output).to eq([ [ [3, 3], score: "26" ] ])
    end

    it "should have scores of 27, 25, 23" do
      analyser = SunspotAnalyser.new('342321442034112344') 
      expect(analyser.output).to eq([ [ [1, 2], score: "27" ],
                                      [ [1, 1], score: "25" ],
                                      [ [2, 2], score: "23" ] ])
    end
  end
end
