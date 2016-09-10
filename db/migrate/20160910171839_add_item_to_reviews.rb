class AddItemToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :item, index: true, foreign_key: true
  end
end
