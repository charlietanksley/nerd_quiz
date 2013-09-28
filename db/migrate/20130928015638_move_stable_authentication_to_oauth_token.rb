class MoveStableAuthenticationToOauthToken < ActiveRecord::Migration
  def change
    rename_table :stable_authentications, :oauth_tokens
    add_column :oauth_tokens, :expires_at, :datetime
    remove_column :oauth_tokens, :uid
  end
end
