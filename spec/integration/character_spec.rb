# encoding: utf-8

require 'spec_helper'

describe Battlenet::Modules::Character do
  let(:api) { Battlenet.new(:eu, ENV['API_KEY']) }

  it "fetches character data" do
    VCR.use_cassette('character_sweetlie') do
      character = api.character 'archimonde', 'sweetlie'
      character['level'].should == 110
    end
  end

  it "fetches additional character data" do
    VCR.use_cassette('character_mortawa_titles') do
      character = api.character 'archimonde', 'sweetlie', :fields => 'titles'
      character['titles'].find { |t| t['selected'] == true }['name'].should == "Archdruid %s"
    end
  end
end
