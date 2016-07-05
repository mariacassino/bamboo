class Item < ActiveRecord::Base
  belongs_to :store
  belongs_to :seller, through: :store



end
