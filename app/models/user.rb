class User < ActiveRecord::Base
  has_one :oauth_token, inverse_of: :user, dependent: :destroy
end
