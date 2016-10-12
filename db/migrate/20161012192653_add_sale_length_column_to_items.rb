class AddSaleLengthColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :sale_length, :integer 
  end
end
