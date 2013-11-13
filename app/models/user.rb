class User < ActiveRecord::Base
  has_one :oauth_token, inverse_of: :user, dependent: :destroy

  def self.authenticate(api_token)
    joins(:oauth_token)
      .merge(OauthToken.where(token: api_token))
      .first
  end

  def api_token
    oauth_token.token
  end
end
