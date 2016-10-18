class AddSalePercentToItem < ActiveRecord::Migration
  def change
    add_column :items, :sale_percent, :integer 
  end
end
