class AddSalePriceColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :sale_price, :decimal, :precision => 8, :scale => 2
  end
end
