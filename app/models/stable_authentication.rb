class StableAuthentication < ActiveRecord::Base
  belongs_to :user, inverse_of: :stable_authentication
end
