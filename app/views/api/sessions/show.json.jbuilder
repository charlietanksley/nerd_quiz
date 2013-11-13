json.key_format! camelize: :lower

json.api_key current_user.oauth_token.token
json.extract! current_user, :id, :name
