class CreateUsers < ActiveRecord::Migration
 
  def change
    create_table :users do |t|

     # t.has_many :items

      t.string "first_name"
      t.string "last_name"
      t.string "username", :null => false, index: true
      t.string "email", :null => false, index: true
      t.string "password" , :null => false
     # t.string "password_digest", :null =>false
      t.boolean "gender"
      t.string "photo", default: ""
      #t.boolean "email_verified", default: false
      t.integer "points", default: 0
      t.string "city"
      t.string "country"
      t.date "date_birth"
      t.timestamps

    end
end
end