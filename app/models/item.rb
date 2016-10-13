class Item < ActiveRecord::Base
  belongs_to :shop
  belongs_to :seller
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def stripe_amount
    price.to_f * 100
  end

  def sale_end_date
    (sale_start + sale_length.days)
  end

end
