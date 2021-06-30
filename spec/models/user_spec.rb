require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録がうまくいくとき' do
    describe "ユーザー新規登録" do
      it 'すべての項目が入力されていれば新規登録できる。' do
        expect(@user).to be_valid
      end
      it 'passwordが英数混合で６文字以上なら登録できる' do
        @user.password = @user.password
        expect(@user).to be_valid
      end
      it 'nicknameとemail、passwordとpassword_confirmationが一致すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'last_nameが漢字であれば登録できる' do
        @user.last_name = @user.last_name
        expect(@user).to be_valid
      end
      it 'first_nameが漢字であれば登録できる' do
        @user.first_name = @user.first_name
        expect(@user).to be_valid
      end
      it 'last_read_nameがカタカナであれば登録できる' do
        @user.last_read_name = @user.last_read_name
        expect(@user).to be_valid
      end
      it 'first_read_nameがカタカナであれば登録できる' do
        @user.first_read_name = @user.first_read_name
        expect(@user).to be_valid
      end
    end
  end

  context '新規登録が上手く行かないとき' do
  describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
     end
     it "passwordが空では登録できない" do
         @user.password = ''
         @user.valid?
         expect(@user.errors.full_messages).to include "Password can't be blank"
     end
     it "passwordは英字だけでは登録できない" do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
     end
     it "passwordは数字だけでは登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
     end
     it "passwordに全角が入っていると登録できない" do
      @user.password = 'ＡＢＣ１２３'
      @user.password_confirmation = 'ＡＢＣ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
     end
     it "birthdayが空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
     end
     it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
     end
     it "last_nameは半角カタカナでは登録できない" do
      @user.last_name = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
     end
     it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
     end
     it "first_nameは半角カタカナでは登録できない" do
      @user.first_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
     end
     it "last_read_nameが空では登録できない" do
      @user.last_read_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last read name is invalid"
     end
     it "last_read_nameがひらがなでは登録できない" do
      @user.last_read_name = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last read name is invalid"
     end
     it "last_read_nameが漢字では登録できない" do
      @user.last_read_name = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last read name is invalid"
     end
     it "last_read_nameが半角カタカナでは登録できない" do
      @user.last_read_name = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last read name is invalid"
     end
     it "first_read_nameが空では登録できない" do
      @user.first_read_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First read name is invalid"
     end
     it "first_read_nameがひらがなでは登録できない" do
      @user.first_read_name = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include "First read name is invalid"
     end
     it "first_read_nameが漢字では登録できない" do
      @user.first_read_name = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include "First read name is invalid"
     end
     it "first_read_nameが半角カタカナでは登録できない" do
      @user.first_read_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First read name is invalid"
     end
     it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
      it 'メールアドレスは、@がないと登録できない' do
        @user.email = 'hogehoge.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
    end
  end
end