require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品購入が上手くいくとき' do
    context '商品の出品' do
      before do
        このグループの前提条件
      end
      it 'テストの説明' do
        テスト内容
      end
    end
  end
end
