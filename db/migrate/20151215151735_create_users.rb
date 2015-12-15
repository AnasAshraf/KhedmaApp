class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :location
      t.string :gender
      t.string :photo

      t.timestamps null: false
    end
  end
end
