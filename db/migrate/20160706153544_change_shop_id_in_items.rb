class ChangeShopIdInItems < ActiveRecord::Migration
  def change
    change_column :items, :shop_id, 'integer USING CAST(shop_id AS integer)'
  end
end
