require 'oauth2'
require_relative './access_token_builder'
require_relative './nerd_cache'

NerdRepository = Struct.new(:access_token) do
  def self.cache(user, force: false)
    token = AccessTokenBuilder.build(user)
    nerds = new(token).all

    NerdCache.cache(nerds, force: force)
  end

  def all
    access_token.get('users.json').parsed
  end
end
