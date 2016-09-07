class Item < ActiveRecord::Base
  belongs_to :shop
  belongs_to :seller
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png",
    storage: :s3,
    bucket: "bambooapp",
    s3_credentials: Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def s3_credentials
    {:bucket => ENV["S3_BUCKET_NAME"], :access_key_id => ENV["AWS_ACCESS_KEY_ID"],
    :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"], :s3_region => ENV['AWS_REGION']}
  end


  def stripe_amount
    price.to_f * 100
  end

end
