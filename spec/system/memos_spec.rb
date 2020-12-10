require 'rails_helper'

RSpec.describe 'メモ記録', type: :system do
  before do
    @client1 = FactoryBot.create(:client)
    @client2 = FactoryBot.create(:client)
    @memo = Faker::Lorem.sentence
    sleep(1)
  end
  
  context 'メモが記録できるとき'do
    it 'ログインしたユーザーはクライアントページでメモできる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @client1.user.email
      fill_in 'Password', with: @client1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # クライアントに「お客様メモ」ボタンがあることを確認する
      expect(
        all(".more")[1].hover
      ).to have_link 'お客様メモ', href: client_path(@client1)
      # お客様メモページに遷移する
      visit client_path(@client1)
      # フォームに情報を入力する
      fill_in 'memo_text', with: @memo
      # メモを記録すると、Memoモデルのカウントが1上がることを確認する
      expect{
        find('input[value="記録"]').click
      }.to change { Memo.count }.by(1)
      # メモページにリダイレクトされることを確認する
      expect(current_path).to eq client_path(@client1)
      # メモページ上に先ほどのメモ内容が含まれていることを確認する
      expect(page).to have_content @memo
   end
  end
end

RSpec.describe 'メモ削除', type: :system do
    before do
      @client1 = FactoryBot.create(:client)
      @client2 = FactoryBot.create(:client)
      @memo = Faker::Lorem.sentence
      sleep(1)
    end
  context 'メモが削除ができるとき' do
    it 'ログインしたユーザーは自らが作成したメモの削除ができる' do
      # クライアント1を作成したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @client1.user.email
      fill_in 'Password', with: @client1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # クライアント1に「お客様メモ」ボタンがあることを確認する
      expect(
        all(".more")[1].hover
      ).to have_link 'お客様メモ', href: client_path(@client1)
      # お客様メモページに遷移する
      visit client_path(@client1)
      # フォームに情報を入力する
      fill_in 'memo_text', with: @memo
      # メモを記録すると、Memoモデルのカウントが1上がることを確認する
      expect{
        find('input[value="記録"]').click
      }.to change { Memo.count }.by(1)
      # クライアント1のメモを削除できることを確認する
      click_on 'メモ削除'
      # トップページに遷移する
      visit root_path
    end
  end
  context 'クライアント削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したクライアントの削除ができない' do
      # クライアント1を作成していないユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @client2.user.email
      fill_in 'Password', with: @client2.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # クライアント1に「お客様メモ」ボタンがあることを確認する
      expect(
        all(".more")[1].hover
      ).to have_link 'お客様メモ', href: client_path(@client1)
      # お客様メモページに遷移する
      visit client_path(@client1)
      # クライアント2に「削除」ボタンが無いことを確認する
      expect(
        all(".more")[0].hover
      ).to have_no_link 'メモ削除'
    end
  end
end