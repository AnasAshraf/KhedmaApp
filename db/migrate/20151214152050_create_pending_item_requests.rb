class CreatePendingItemRequests < ActiveRecord::Migration
  def change
  	create_table :pendingItemRequests  do |t|
    # t.integer "owner" , :class_name => "User", :foreign_key => 'User_id'
    t.integer "lendee" , :class_name => "User", :foreign_key => 'User_id' 
    t.references :item , :foreign_key => 'Item_id'
    t.timestamps null: false
	end
			add_index :pendingItemRequests, [ "lendee","Item_id"]
  end
end