class Product < ApplicationRecord
    belongs_to :user, optional: true
    has_many_attached :images
    has_one :purchase_record 
    
    #activehashの導入
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :product_condition
    belongs_to :delivery_charge
    belongs_to :shipping_area
    belongs_to :delivery_day
    with_options presence: true do
        validates :images
        validates :product_name
        validates :product_description
        validates :price
    end

    with_options numericality: { other_than: 1, message: '選択してください'} do
        validates :category_id
        validates :product_condition_id
        validates :delivery_charge_id
        validates :shipping_area_id
        validates :delivery_day_id
    end

    validates :product_name, length: { maximum: 40 }
    validates :product_description, length: { maximum: 1000 }

    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'は半角で入力してください' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300円〜9,999,999の範囲で入力してください' }
    
    #検索機能の追加
    def self.search(search)
      if search != ""
        Product.where('text LIKE(?)', "%#{search}%")
      else
        Product.all
      end
    end
end
