class Order 

  include ActiveModel::Model
  #アトリビュートアクセサーを使用し、保存するカラムをすべて入力
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :product_id, :user_id
  with_options presence: true do
    validates :token
    VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/ 
    validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address

    validates :phone_number, numericality: { with: /\A\d{10,11}\z/ }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select'}

  def save
    purchase_record = PurchaseRecord.create(product_id: product_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end