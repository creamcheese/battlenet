require 'spec_helper'

describe Battlenet::Modules::Achievement do
  let(:api) { Battlenet.new(:us, ENV['API_KEY']) }

  it "fetches achievement data" do
    VCR.use_cassette('over_9000') do
      ach = api.achievement '4496'
      ach['title'].should == "It's Over Nine Thousand!"
      ach['points'].should == 10
      ach['criteria'][0]['id'].should == 12698
    end
  end
end
