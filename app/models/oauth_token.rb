class OauthToken < ActiveRecord::Base
  belongs_to :user, inverse_of: :oauth_token
end
