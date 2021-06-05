class Order Shipping Address

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture, :municipality, :address, :building_name, :phone_number, :purchase_record_id, :product_id, :user_id
  with_options presence: true do
    validates :token
    validates :postal_code, numericality: { with: /\A\d{3}[-]\d{4}\z/, message: 'Postal code is invalid. Enter it as follows (e.g. 123-4567)'}
    validates :prefecture, numericality: { other_than: 1, message: 'Select'}
    validates :municipality
    validates :addresses
    validatable :phone_number numericality:{ with: /\A\d{11}\z/}
  end
  
  def save
    
  end
end