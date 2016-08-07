class Item < ActiveRecord::Base
  belongs_to :shop
  belongs_to :seller
  belongs_to :user


  def stripe_amount
    price.to_f * 100
  end

end
