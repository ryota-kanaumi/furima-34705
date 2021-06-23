FactoryBot.define do
  factory :order do
    postal_code {"169-0072"}
    prefecture_id {14}
    municipality {"新宿区"}
    address {"大久保1-1"}
    phone_number {"05012341234"}
    token {"tok_abcdefghijk00000000000000000"} 
  end
end
