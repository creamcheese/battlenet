# encoding: utf-8

require 'spec_helper'

describe Battlenet do
  let(:api) { Battlenet.new(:eu, ENV['API_KEY']) }

  before(:each) do
    Battlenet.locale = "es_ES"
  end

  after(:each) do
    Battlenet.locale = nil
  end

  it "localizes data" do
    VCR.use_cassette('character_mortawa_es') do
      character = api.character 'archimonde', 'sweetlie', :fields => 'talents'
      expect(character['talents'].first['talents'].first['spell']['name']).to eq("Cultivo")
    end
  end
end
