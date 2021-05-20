require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
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
     it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
     end
     it "last_read_nameが空では登録できない" do
      @user.last_read_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last read name is invalid"
     end
     it "first_read_nameが空では登録できない" do
      @user.first_read_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First read name is invalid"
     end
   end
 end
end