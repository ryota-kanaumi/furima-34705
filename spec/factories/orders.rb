FactoryBot.define do
  factory :order do
    product_id {3}
    user_id {2}
    postal_code {169-0072}
    prefecture_id {14}
    municipality {新宿区}
    address {大久保1-1}
    phone_number{050-1234-1234}
  end
end
