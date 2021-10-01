require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できる場合" do
      it "全ての項目が入力されていれば実装できる" do
        expect(@user).to be_valid
      end
    end
    context "新規登録できない場合" do
      it "nicknameが空だと登録できない" do
        @user.nickname = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空だと登録できない" do
        @user.email = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "passwordが空では登録できない" do
        @user.password = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "family_nameが空では登録できない" do
        @user.family_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it "first_nameが空では登録できない" do
        @user.first_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = " "
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@がないと登録できない" do
        @user.email = "testgamil.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordは英数字混合出ないと登録できない" do
        @user.password = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは全角だと登録できない" do
        @user.password = "あいうえおか"
        @user.password_confirmation = "あいうえおか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
        @user.family_name_kana = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
    end
  end
end
