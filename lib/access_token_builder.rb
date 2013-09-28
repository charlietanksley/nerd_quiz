class AccessTokenBuilder < OAuth2::AccessToken
  attr_reader :token, :token_bearer

  def self.build(token_bearer)
    new(token_bearer).access_token
  end

  def initialize(token_bearer)
    @token_bearer = token_bearer
    @token = @token_bearer.oauth_token
    super(oauth_client, token.token,
      refresh_token: token.refresh_token,
      expires_at: token.expires_at)
  end

  def access_token
    if expired?
      new_token = self.refresh!
      token.token = new_token.token
      token.refresh_token = new_token.refresh_token
      token.expires_at = new_token.expires_at
      token.save!
    end
    new_token || self
  end

  private
  def oauth_client
    @oauth_client ||= OAuth2::Client.new(ENV["STABLE_APP_ID"], ENV["STABLE_APP_SECRET"], site: "https://stable.bignerdranch.com")
  end
end
