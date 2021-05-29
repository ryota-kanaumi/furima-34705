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
      it "商品名が空だと出品できない" do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Product name can't be blank"
       end
       it "商品説明が空だと出品できない" do
        @product.product_description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Product description can't be blank"
       end
       it "カテゴリーIDを選択しないと出品できない" do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Category Select"
       end
       it "商品の状態を選択しないと出品できない" do
        @product.product_condition_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Product condition Select"
       end
       it "配送料の負担を選択しないと出品できない" do
        @product.delivery_charge_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Delivery charge Select"
       end
       it "発送元の地域を選択しないと出品できない" do
        @product.shipping_area_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipping area Select"
       end
       it "発送までの日数を選択しないと出品できない" do
        @product.delivery_day_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Delivery day Select"
       end
       it "価格が全角数字だと出品できない" do
        @product.price = '５０００'
        @product.valid?
        expect(@product.errors.full_messages).to include "Price Half-width number"
       end
       it "販売価格が300未満だと出品できない" do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include "Price Out of setting range"
       end
       it "販売価格が9,999,999を超えると出品できない" do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include "Price Out of setting range"
       end
    end
  end
end
