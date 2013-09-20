class User < ActiveRecord::Base
  has_one :stable_authentication, inverse_of: :user
end
