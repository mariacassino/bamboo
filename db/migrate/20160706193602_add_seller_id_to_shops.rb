class AddSellerIdToShops < ActiveRecord::Migration
  def change
    add_column :shops, :seller_id, :integer 
  end
end
