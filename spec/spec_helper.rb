require 'battlenet'

require 'timecop'
require 'vcr'

require 'dotenv'
Dotenv.load 
VCR.config do |c|
  c.cassette_library_dir = "spec/fixtures/cassettes"
  c.filter_sensitive_data('<API_KEY>') { ENV['API_KEY']}
  c.stub_with :webmock
end
