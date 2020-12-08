require 'rails_helper'

RSpec.describe Client, type: :model do
  before do
    @client = FactoryBot.build(:client)
  end

  describe 'クライアントの保存' do
    context "クライアントが保存できる場合" do
      it "last_nameとlast_name_kanaがあればクライアントは保存される" do
        expect(@client).to be_valid
      end
      it "last_nameとlast_name_kanaが10文字以下でクライアントは保存される" do
        @client.last_name = "あいうえおかきくけこ"
        @client.last_name_kana = "アイウエオカキクケコ"
        expect(@client).to be_valid
      end
    end

    context "クライアントが保存できない場合" do
      it "last_nameがないとクライアントは保存できない" do
        @client.last_name = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_name_kanaがないとクライアントは保存できない" do
        @client.last_name_kana = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "ユーザーが紐付いていないとクライアントは保存できない" do
        @client.user = nil
        @client.valid?
        expect(@client.errors.full_messages).to include("User must exist")
      end
      it "last_nameが11文字以上だとクライアントは保存できない" do
        @client.last_name = "あいうえおかきくけこさ"
        @client.valid?
        expect(@client.errors.full_messages).to include("Last name is too long (maximum is 10 characters)")
      end
      it "last_name_kanaが11文字以上だとクライアントは保存できない" do
        @client.last_name_kana = "アイウエオカキクケコサ"
        @client.valid?
        expect(@client.errors.full_messages).to include("Last name kana is too long (maximum is 10 characters)")
      end
      it 'last_nameが全角入力でなければ登録できない' do
        @client.last_name = 'ｱｲｳｴｵ'
        @client.valid?
        expect(@client.errors.full_messages).to include('Last name is invalid')
      end
      it 'last_name_kanaが全角カナ入力でなければ登録できない' do
        @client.last_name_kana = 'あいうえお'
        @client.valid?
        expect(@client.errors.full_messages).to include('Last name kana is invalid')
      end
      it "companyが16文字以上だとクライアントは保存できない" do
        @client.company = "アイウエオカキクケコサシスセソタ"
        @client.valid?
        expect(@client.errors.full_messages).to include("Company is too long (maximum is 20 characters)")
      end
    end
  end
end
