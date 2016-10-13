class SetSaleLengthDefaultToZero < ActiveRecord::Migration
  def change
    change_column :items, :sale_length, :integer, :default => 0
  end
end
