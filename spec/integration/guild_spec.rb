require 'spec_helper'

describe Battlenet::Modules::Guild do
  let(:api) { Battlenet.new(:eu, ENV['API_KEY']) }

  it "fetches guild data" do
    VCR.use_cassette('guild_rl_bl') do
      guild = api.guild 'archimonde', 'ZeratoR TV'
      guild['level'].should == 25
    end
  end

  it "fetches additional guild data" do
    VCR.use_cassette('guild_rl_bl_members') do
      guild = api.guild 'archimonde', 'ZeratoR TV', :fields => 'members'
      guild['members'].find { |c| c["character"]["name"] == "Sweetlie" }.fetch("rank").should == 4
    end
  end
end
