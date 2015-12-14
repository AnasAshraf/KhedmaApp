class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends  do |t|
      	
       t.references :user , :foreign_key => 'User_id' 
       t.integer "buddy" , :class_name => "User", :foreign_key => 'User_id' 

      	t.timestamps null: false
    end
          	add_index :friends, ["user_id", "buddy"]
  end
end