require 'rails_helper'

RSpec.describe Check, type: :model do
  before do
    @check = FactoryBot.build(:check)
  end

  describe 'チェックの保存' do
    context 'チェックが保存できる場合' do
      it 'titleと各idがあればチェックは保存される' do
        expect(@check).to be_valid
      end
      it 'titleが10文字以内であればチェックは保存される' do
        @check.title = 'あいうえおかきくけこ'
        expect(@check).to be_valid
      end
    end

    context 'ツイートが保存できない場合' do
      it 'titleがないとチェックは保存できない' do
        @check.title = ''
        @check.valid?
        expect(@check.errors.full_messages).to include("Title can't be blank")
      end
      it 'smileがないとチェックは保存できない' do
        @check.smile_id = 0
        @check.valid?
        expect(@check.errors.full_messages).to include('Smile must be other than 0')
      end
      it 'aizuchiがないとチェックは保存できない' do
        @check.aizuchi_id = 0
        @check.valid?
        expect(@check.errors.full_messages).to include('Aizuchi must be other than 0')
      end
      it 'empathyがないとチェックは保存できない' do
        @check.empathy_id = 0
        @check.valid?
        expect(@check.errors.full_messages).to include('Empathy must be other than 0')
      end
      it 'reactionがないとチェックは保存できない' do
        @check.reaction_id = 0
        @check.valid?
        expect(@check.errors.full_messages).to include('Reaction must be other than 0')
      end
      it 'questionがないとチェックは保存できない' do
        @check.question_id = 0
        @check.valid?
        expect(@check.errors.full_messages).to include('Question must be other than 0')
      end
      it 'ユーザーが紐付いていないとチェックは保存できない' do
        @check.user = nil
        @check.valid?
        expect(@check.errors.full_messages).to include('User must exist')
      end
      it 'ユーザーが紐付いていないとチェックは保存できない' do
        @check.user = nil
        @check.valid?
        expect(@check.errors.full_messages).to include('User must exist')
      end
      it 'クライアントが紐付いていないとチェックは保存できない' do
        @check.client = nil
        @check.valid?
        expect(@check.errors.full_messages).to include('Client must exist')
      end
      it 'titleが11文字以上だとチェックは保存できない' do
        @check.title = 'アイウエオカキクケコサ'
        @check.valid?
        expect(@check.errors.full_messages).to include('Title is too long (maximum is 10 characters)')
      end
    end
  end
end
