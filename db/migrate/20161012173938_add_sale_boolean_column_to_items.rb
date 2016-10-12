class AddSaleBooleanColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :on_sale, :boolean, default: false 
  end
end
