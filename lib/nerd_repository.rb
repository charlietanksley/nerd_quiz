require 'oauth2'

NerdRepository = Struct.new(:access_token) do
  def all
    access_token.get('users.json').parsed
  end
end
