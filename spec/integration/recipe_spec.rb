require 'spec_helper'

describe Battlenet::Modules::Recipe do
  let(:api) { Battlenet.new(:eu, ENV['API_KEY']) }

  it "fetches recipe data" do
    VCR.use_cassette('recipe_27984') do
      recipe = api.recipe '27984'
      recipe['name'].should == "Mongoose"
    end
  end
end
