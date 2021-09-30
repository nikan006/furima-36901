require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空だと登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "family_nameが空では登録できない" do
    end
    it "first_nameが空では登録できない" do
    end
    it "family_nameが空では登録できない" do
    end
    it "first_name_kanaが空では登録できない" do
    end
    it "family_name_kanaが空では登録できない" do
    end
    it "birth_dateが空では登録できない" do
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
    end
    it "重複したemailが存在する場合登録できない" do
    end
    it "passwordが5文字以下では登録できない" do
    end
    it "passwordは英数字混合出ないと登録できない" do
    end
  end
end
