class Item < ActiveRecord::Base
  belongs_to :shop
  belongs_to :seller
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def stripe_amount
    price.to_f * 100
  end

  def stripe_sale_amount
    sale_price.to_f * 100
  end

  def on_sale?
    if sale_end > Time.now
      return true
    else
      return false
    end
  end

end
