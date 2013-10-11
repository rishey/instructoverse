class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      # t.string :password_digest
      t.string  :provider
      # t.integer :uid
      t.string :uid
      t.string  :name
      t.string  :oauth_token
      t.datetime  :oauth_expires_at
      t.timestamps
    end
  end
end
