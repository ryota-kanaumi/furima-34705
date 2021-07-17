require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  context '商品出品がうまくいくとき' do
    describe "商品の新規出品" do
      it 'すべての項目が入力されていれば商品出品できる。' do
        expect(@product).to be_valid
      end
      it '商品名があれば出品できる' do
        @product.product_name = @product.product_name
        expect(@product).to be_valid
      end
      it '商品説明があれば出品できる' do
        @product.product_description = @product.product_description
        expect(@product).to be_valid
      end
      it 'カテゴリーIDを選択すれば出品できる' do
        @product.category_id = @product.category_id
        expect(@product).to be_valid
      end
      it '商品の状態を選択すれば出品できる' do
        @product.product_condition_id = @product.product_condition_id
        expect(@product).to be_valid
      end
      it '送料の負担を選択すれば出品できる' do
        @product.delivery_charge_id = @product.delivery_charge_id
        expect(@product).to be_valid
      end
      it '発送地域を選択すれば出品できる' do
        @product.shipping_area_id = @product.shipping_area_id
        expect(@product).to be_valid
      end
      it '配送までの日数を選択すれば出品できる' do
        @product.delivery_day_id = @product.delivery_day_id
        expect(@product).to be_valid
      end
      it '価格を入力すれば出品できる' do
        @product.price = @product.price
        expect(@product).to be_valid
      end
    end
  end
  context '商品出品がうまく行かないとき' do
    describe "商品の新規出品" do
      it "imageが空だと出品できない" do
        @product.images = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "出品画像を入力してください"
       end
      it "商品名が空だと出品できない" do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "商品名を入力してください"
       end
       it "商品説明が空だと出品できない" do
        @product.product_description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "商品の説明を入力してください"
       end
       it "カテゴリーIDを選択しないと出品できない" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "カテゴリーを選択してください"
       end
       it "商品の状態を選択しないと出品できない" do
        @product.product_condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "商品の状態を選択してください"
       end
       it "配送料の負担を選択しないと出品できない" do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "配送料の負担を選択してください"
       end
       it "発送元の地域を選択しないと出品できない" do
        @product.shipping_area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "発送元の地域を選択してください"
       end
       it "発送までの日数を選択しないと出品できない" do
        @product.delivery_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "発送までの日数を選択してください"
       end
       it "価格が全角数字だと出品できない" do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include "販売価格は半角で入力してください"
       end
       it "販売価格が300未満だと出品できない" do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include "販売価格は300円〜9,999,999の範囲で入力してください"
       end
       it "販売価格が9,999,999を超えると出品できない" do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include "販売価格は300円〜9,999,999の範囲で入力してください"
       end
       it "販売価格が英数字混合では登録できないこと" do
        @product.price = '123abc'
        @product.valid?
        expect(@product.errors.full_messages).to include "販売価格は300円〜9,999,999の範囲で入力してください"
       end
       it "販売価格が半角英字では登録できないこと" do
        @product.price = 'abcdeg'
        @product.valid?
        expect(@product.errors.full_messages).to include "販売価格は300円〜9,999,999の範囲で入力してください"
       end
    end
  end
end
