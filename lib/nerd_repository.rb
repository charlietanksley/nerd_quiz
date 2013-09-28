require 'oauth2'

NerdRepository = Struct.new(:access_token) do
  def all
    @all ||= access_token.get('users.json')
  end

  def to_a
    all.parse
  end

  def to_json
    all
  end
end
