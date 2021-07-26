class Tag < ApplicationRecord
  #タグ付機能の追加
  has_many :product_tag_relations
  has_many :procucts, through: :procuct_tag_relations
end
