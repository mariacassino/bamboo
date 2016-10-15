class SetSaleBooleanToNullFalse < ActiveRecord::Migration
  def change
    change_column :items, :on_sale, :boolean, default: false, null: false 
  end
end
