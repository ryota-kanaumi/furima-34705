class ProductTagsRelation < ApplicationRecord
  #タグ付機能の追加
  belongs_to :procuct
  belongs_to :tag
end
