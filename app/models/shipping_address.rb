class ShippingAddress < ApplicationRecord
  belongs_to :purchase_record 
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
