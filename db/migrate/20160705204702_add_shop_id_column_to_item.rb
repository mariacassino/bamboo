class AddShopIdColumnToItem < ActiveRecord::Migration
  def change
    add_column :items, :shop_id, :string 
  end
end
