class Item < ActiveRecord::Base
	belongs_to :user 
	has_one :lending
	has_one :pendig_request
	#belongs_to :user , through :items_users
end
