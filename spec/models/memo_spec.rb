require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
  end

  describe 'メモの保存' do
    context "メモが保存できる場合" do
      it "textがあればメモは保存される" do
        expect(@memo).to be_valid
      end
      it "textが100文字以下でクライアントは保存される" do
        @memo.text = "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789"
        expect(@memo).to be_valid
      end
    end
    context "メモが保存できない場合" do
      it "textがないとメモは保存できない" do
        @memo.text = ""
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Text can't be blank")
      end     
      it "ユーザーが紐付いていないとメモは保存できない" do
        @memo.user = nil
        @memo.valid?
        expect(@memo.errors.full_messages).to include("User must exist")
      end
      it "クライアントが紐付いていないとメモは保存できない" do
        @memo.client = nil
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Client must exist")
      end
      it "textが101文字以上だとメモは保存できない" do
        @memo.text = "01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Text is too long (maximum is 100 characters)")
      end
    end
  end
end
