require 'spec_helper'

describe Battlenet::Modules::Auction do
  let(:api) { Battlenet.new(:us, ENV['API_KEY']) }

  it "fetches auction data" do
    VCR.use_cassette('auction_files') do
      auction = api.auction 'medivh'
      expect(nil).to be_nil
      expect(auction['files'].first['url']).to match(/auction-api-us.worldofwarcraft.com/)
    end
  end

  it "fetches auction data" do
    VCR.use_cassette('auction_data') do
      data = api.auction_data 'medivh'
      expect(data['realms'].first['name']).to eq 'Medivh'
    end
  end
end
