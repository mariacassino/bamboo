class SetSaleStartToTimestampDefault < ActiveRecord::Migration
  def change
    change_column :items, :sale_start, :datetime, :default => Time.now 
  end
end
