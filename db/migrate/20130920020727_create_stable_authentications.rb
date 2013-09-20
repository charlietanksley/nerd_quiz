class CreateStableAuthentications < ActiveRecord::Migration
  def change
    create_table :stable_authentications do |t|
      t.string :token, null: false
      t.string :refresh_token, null: false
      t.integer :uid, null: false
      t.references :user, null: false, index: true

      t.timestamps
    end
  end
end
