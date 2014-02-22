require './spec/spec_helper'

describe SunspotAnalyser do
  it "should not be nil" do
    expect(SunspotAnalyser.new('342321442034112344')).not_to be_nil
  end
end
