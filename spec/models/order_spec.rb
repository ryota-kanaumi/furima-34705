require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
     @order = FactoryBot.build(:order)
     @order.user_id = FactoryBot.build(:user)
     @order.product_id = FactoryBot.build(:product)
  end
  describe '商品購入が上手くいくとき' do
    context '商品の購入' do
      it 'すべての項目が入力されていれば商品購入できる。' do
        expect(@order).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end
  end
  describe '商品購入がうまくいかないとき' do
    context '商品の購入' do
      it 'クレジットカード情報が入力されていなければ購入できない。' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end
      it '郵便番号が空では購入できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号が６桁では購入できない' do
        @order.postal_code = "123-123"
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code is invalid"
      end
      it '郵便番号がハイフンなしでは購入できない' do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code is invalid"
      end
      it '都道府県を選択しないと購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture Select"
      end
      it '市区町村を入力しないと購入できない' do
        @order.municipality = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Municipality can't be blank"
      end
      it '番地が空では購入できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空では購入できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号が数字以外では購入できない' do
        @order.phone_number = "玉子焼き"
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is not a number"
      end
      it '電話番号が全角数字では購入できない' do
        @order.phone_number = "０９０２２３３２２３３"
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is not a number"
      end
      it '電話番号が12桁では購入できない' do
        @order.phone_number = "123123123123"
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end
      it '電話番号が英数混合では購入できない' do
        @order.phone_number = "abc12345678"
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is not a number"
      end
      it 'user_idがなければ購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "User can't be blank"
      end
      it 'product_idがなければ購入できない' do
        @order.product_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Product can't be blank"
      end
    end
  end
end
