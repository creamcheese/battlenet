# encoding: utf-8

require 'spec_helper'

describe Battlenet::Modules::Realm do
  let(:api) { Battlenet.new(:eu, ENV['API_KEY']) }

  it "fetches realm data" do
    VCR.use_cassette('realm') do
      realm = api.realm
      realm['realms'].find { |r| r['name'] == 'Archimonde' }['population'].should == 'high'
    end
  end
end
