class CreatePendingRequests < ActiveRecord::Migration
  def change
    create_table :pending_requests do |t|
    	 # t.integer "owner" , :class_name => "User", :foreign_key => 'User_id'
    	# t.integer "lendee" , :class_name => "User", :foreign_key => 'User_id'
    	t.references :user , :foreign_key => 'User_id' 
    	t.references :item , :foreign_key => 'Item_id'
    	t.timestamps null: false

      t.timestamps null: false
    end
    add_index :pending_requests, [ "User_id","Item_id"]
  end
end
