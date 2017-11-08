# require 'rails_helper'

# RSpec.describe User, type: :model do
#   context 'class methods' do
#     it '.from_oauth' do
#       raw_data = {
#         :provider=>"facebook",
#         :uid=>"12345",
#         :info=> {
#           :email=>"aaron@aaron.com",
#           :name=>"aaron",
#           :image=>"http://via.placeholder.com/150x150"
#         },
#         credentials:=> {
#           :token=> "abcdefg123456",
#           :expires_at=>1514962006,
#           :expires=>true
#         },
#         :extra=> {
#           :raw_info=> {
#             :name=>"aaron",
#             :email=>"aaron@aaron.com",
#             :id=>"12345"
#           }
#         }
#       }

#       User.from_oauth(raw_data)

#       user = User.last

#       expect(user.username).to eq 'aaron'
#       expect(user.email).to eq 'aaron@aaron.com'
#       expect(user.oauth_token).to eq "abcdefg123456"
#     end
#   end
# end
