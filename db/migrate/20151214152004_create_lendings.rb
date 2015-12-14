class CreateLendings < ActiveRecord::Migration
  def change
    create_table :lendings do |t|
			
			t.references :user
			t.integer "lendee" , :class_name => "User", :foreign_key => 'User_id'
			t.integer "item_id", :class_name => "Item"
	      	
      t.timestamps null: false
    end
  end
end