class Order 

  include ActiveModel::Model
  #アトリビュートアクセサーを使用し、保存するカラムをすべて入力
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :product_id, :user_id
  with_options presence: true do
    validates :token
    VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/ 
    validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }
    validates :municipality
    validates :address
    validates :user_id
    validates :product_id
    validates :phone_number, numericality: true, length: { minimum: 10 }, length: { maximum: 11 }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select'}

  def save
    purchase_record = PurchaseRecord.create(product_id: product_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end