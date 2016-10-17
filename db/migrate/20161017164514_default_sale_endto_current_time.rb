class DefaultSaleEndtoCurrentTime < ActiveRecord::Migration
  def change
    change_column :items, :sale_end, :datetime, :default => Time.now 
  end
end
