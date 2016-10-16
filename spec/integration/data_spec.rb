require 'spec_helper'

describe Battlenet::Modules::Data do
  let(:api) { Battlenet.new(:us, ENV['API_KEY']) }


  it "fetches character races data" do
    VCR.use_cassette('character_races') do
      data = api.character_races
      data["races"].first["name"].should == "Human"
    end
  end

  it "fetches character classes data" do
    VCR.use_cassette('character_classes') do
      data = api.character_classes
      data["classes"].first["name"].should == "Hunter"
    end
  end

  it "fetches guild rewards data" do
    VCR.use_cassette('guild_rewards') do
      data = api.guild_rewards
      data["rewards"].first["achievement"]["description"].should == "Owner of Dragonwrath, Tarecgosa's Rest."
    end
  end

  it "fetches guild perks data" do
    VCR.use_cassette('guild_perks') do
      data = api.guild_perks
      data["perks"].first["spell"]["name"].should == "Mount Up"
    end
  end

  it "fetches item classes data" do
    VCR.use_cassette('item_classes') do
      data = api.item_classes
      data["classes"].first["name"].should == "Battle Pets"
    end
  end

  it "fetches character achievements data" do
    VCR.use_cassette('character_achievements') do
      data = api.character_achievements
      data["achievements"].first["name"].should == "General"
      data["achievements"].first["achievements"].first["title"].should == "Level 10"
    end
  end

  it "fetches guild achievements data" do
    VCR.use_cassette('guild_achievements') do
      data = api.guild_achievements
      data["achievements"].first["name"].should == "General"
      data["achievements"].first["achievements"].first["title"].should == "Everyone Needs a Logo"
    end
  end
end
