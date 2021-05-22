class Product < ApplicationRecord
    belongs_to :user
    with_options presence: true do
    has_one_attached :image
    end
  end
