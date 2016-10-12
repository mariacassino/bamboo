class AddSaleStartColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :sale_start, :datetime 
  end
end
