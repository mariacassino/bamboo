class DropSellersTable < ActiveRecord::Migration
  def down
   drop_table :sellers 
 end

end
