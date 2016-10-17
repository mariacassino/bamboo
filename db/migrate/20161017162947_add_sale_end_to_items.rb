class AddSaleEndToItems < ActiveRecord::Migration
  def change
    add_column :items, :sale_end, :datetime 
  end
end
