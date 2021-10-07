require 'rails_helper'

RSpec.describe OrderDeliverys, type: :model do
  describe "購入商品情報の保存" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_deliverys = FactoryBot.build(:order_deliverys, user_id: user.id, item_id: item.id)
      sleep 0.3
    end

    context "内容に問題がない場合" do
      it "全ての値が正しく入力されていれば保存できる" do
        expect(@order_deliverys).to be_valid
      end
      it "建物名は空でも保存できる" do
        @order_deliverys.adress2 = ""
        expect(@order_deliverys).to be_valid
      end
    end

    context "内容に問題がある場合" do
      it "郵便番号が空だと保存できないこと" do
        @order_deliverys.zip_code = ""
        @order_deliverys.valid?
        expect(@order_deliverys.errors.full_messages).to include("Zip code can't be blank")
      end
      it "郵便番号は3桁ハイフン4桁の半角文字列のみ保存可能なこと" do
        @order_deliverys.zip_code = "1234567"
        @order_deliverys.valid?
        expect(@order_deliverys.errors.full_messages).to include("Zip code is invalid")
      end
      it "都道府県名が空だと保存できないこと" do
        @order_deliverys.prefecture_id = 1
        @order_deliverys.valid?
        expect(@order_deliverys.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市町村区が空だと保存できないこと" do
        @order_deliverys.city = ""
        @order_deliverys.valid?
        expect(@order_deliverys.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空だと保存できないこと" do
        @order_deliverys.adress1 = ""
        @order_deliverys.valid?
        expect(@order_deliverys.errors.full_messages).to include("Adress1 can't be blank")
      end
      it "電話番号が空だと保存できないこと" do
        @order_deliverys.telephone = ""
        @order_deliverys.valid?
        expect(@order_deliverys.errors.full_messages).to include("Telephone can't be blank")
      end
      it "電話番号は10桁以上11桁以内の半角数値のみ保存可能なこと" do
        @order_deliverys.telephone ="1234"
        @order_deliverys.valid?
        expect(@order_deliverys.errors.full_messages).to include("Telephone is invalid")
      end
    end
  end
end
