FactoryBot.define do
  factory :product do
    product_name {"おいしいりんごジュース"}
    product_description{"直接取引をしている契約農家から産地直送で新鮮なりんごをすぐにお届けするため一本一果(一本の果樹に1つしか実を残さない)のため、すべての栄養が1つの実に注がれている"}
    category_id {2}
    product_condition_id {2}
    delivery_charge_id {2}
    shipping_area_id {2}
    delivery_day_id {2}
    price {5000}
  after(:build) do |product|
    product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
 end
end
