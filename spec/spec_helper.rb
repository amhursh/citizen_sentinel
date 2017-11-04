require 'simplecov'

SimpleCov.start do
  add_filter "/spec/"
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
  {
    "provider"=>"facebook",
    "uid"=>"12345",
    "info"=> {
      "email"=>"aaron@aaron.com",
      "name"=>"aaron",
      "image"=>"http://via.placeholder.com/150x150"
      },
    "credentials"=> {
      "token"=> "abcdefg123456",
      "expires_at"=>1514962006,
      "expires"=>true
      },
    "extra"=> {
      "raw_info"=> {
        "name"=>"aaron",
        "email"=>"aaron@aaron.com",
        "id"=>"12345"
        }
      }
    }
    )
end
