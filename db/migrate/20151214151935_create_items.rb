class CreateItems < ActiveRecord::Migration
  
  def change
    create_table :items do |t|

    t.string :name ,:null=> false
    t.integer :weight ,:null=>false
    t.string :description
   	t.belongs_to :user
    t.timestamps null: false
    
    end
  end
end