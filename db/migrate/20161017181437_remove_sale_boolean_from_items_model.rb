class RemoveSaleBooleanFromItemsModel < ActiveRecord::Migration
  def up
    remove_column :items, :on_sale
  end

  def down
    add_column :items, :on_sale, :boolean 
  end
end
