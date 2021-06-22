class Product < ApplicationRecord
    belongs_to :user, optional: true
    has_one_attached :image

    #activehashの導入
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :product_condition
    belongs_to :delivery_charge
    belongs_to :shipping_area
    belongs_to :delivery_day
    with_options presence: true do
        validates :image
        validates :product_name
        validates :product_description
        validates :price
    end

    with_options numericality: { other_than: 1, message: 'Select'} do
        validates :category_id
        validates :product_condition_id
        validates :delivery_charge_id
        validates :shipping_area_id
        validates :delivery_day_id
    end

    validates :product_name, length: { maximum: 40 }
    validates :product_description, length: { maximum: 1000 }

    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price,
    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
