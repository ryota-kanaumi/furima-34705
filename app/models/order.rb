class Order ShippingAddress

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_record_id, :product_id, :user_id
  with_options presence: true do
    validates :token
    validates :postal_code, numericality: { with: /\A\d{3}[-]\d{4}\z/, message: 'Postal code is invalid. Enter it as follows (e.g. 123-4567)'}
    validates :prefectures, numericality: { other_than: 1, message: 'Select'}
    validates :municipality
    validates :addresses
    validates :phone_number, numericality:{ with: /\A\d{11}\z/}
  end
  
  def save
    purchase_record = PurchaseRecord.create(product_id: product_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end