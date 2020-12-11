require 'rails_helper'

RSpec.describe 'クライアント作成', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @client_last_name = '阿部'
    @client_last_name_kana = 'タロウ'
  end
  context 'クライアント作成ができるとき' do
    it 'ログインしたユーザーは新規作成できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規作成ページへのリンクがあることを確認する
      expect(page).to have_content('お客様カード新規作成')
      # 作成ページに移動する
      visit new_client_path
      # フォームに情報を入力する
      fill_in 'client_last_name', with: @client_last_name
      fill_in 'client_last_name_kana', with: @client_last_name_kana
      # 送信するとClientモデルのカウントが1上がることを確認する
      expect  do
        find('input[value="完了"]').click
      end.to change { Client.count }.by(1)
      # トップページに遷移する
      visit root_path
      # トップページには先ほど投稿した内容のクライアントが存在することを確認する（last_name）
      expect(page).to have_content(@client_last_name)
      # トップページには先ほど投稿した内容のクライアントが存在することを確認する（last_name_kana）
      expect(page).to have_content(@client_last_name_kana)
    end
  end
  context 'クライアント作成ができないとき' do
    it 'ログインしていないと新規作成ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規作成ページへのリンクがない
      expect(page).to have_no_content('お客様カード新規作成')
    end
  end
end

RSpec.describe 'クライアント詳細', type: :system do
  before do
    @client = FactoryBot.create(:client)
  end
  it 'ログインしたユーザーはクライアント詳細ページに遷移してメモ投稿欄が表示される' do
    # ログインする
    visit new_user_session_path
    fill_in 'Email', with: @client.user.email
    fill_in 'Password', with: @client.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # クライアントに「お客様メモ」ボタンがあることを確認する
    expect(
      all('.more')[0].hover
    ).to have_link 'お客様メモ', href: client_path(@client)
    # お客様メモページに遷移する
    visit client_path(@client)
    # お客様メモページにクライアントの内容が含まれている
    expect(page).to have_content(@client.last_name.to_s)
    expect(page).to have_content(@client.last_name_kana.to_s)
    # メモ用のフォームが存在する
    expect(page).to have_selector 'form'
  end
  it 'ログインしていない状態でクライアント詳細ページに遷移できない' do
    # トップページに移動する
    visit root_path
    # お客様メモページへのリンクがない
    expect(page).to have_no_content('お客様メモ')
  end
end

RSpec.describe 'クライアント編集', type: :system do
  before do
    @client1 = FactoryBot.create(:client)
    @client2 = FactoryBot.create(:client)
    sleep(1)
  end
  context 'クライアント編集ができるとき' do
    it 'ログインしたユーザーは自分が作成したクライアントの編集ができる' do
      # クライアント1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @client1.user.email
      fill_in 'Password', with: @client1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # クライアント1に「お客様メモ」ボタンがあることを確認する
      expect(
        all('.more')[1].hover
      ).to have_link 'お客様メモ', href: client_path(@client1)
      # お客様メモページに遷移する
      visit client_path(@client1)
      # クライアント1に「編集」ボタンがあることを確認する
      expect(
        all('.more')[0].hover
      ).to have_link '編集', href: edit_client_path(@client1)
      # 編集ページへ遷移する
      visit edit_client_path(@client1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#client_last_name').value
      ).to eq @client1.last_name
      expect(
        find('#client_last_name_kana').value
      ).to eq @client1.last_name_kana
      # 投稿内容を編集する
      fill_in 'client_last_name', with: "#{@client1.last_name}+編集テスト"
      fill_in 'client_last_name_kana', with: "#{@client1.last_name_kana}+ヘンシュウテスト"
      # 編集してもClientモデルのカウントは変わらないことを確認する
      expect  do
        find('input[value="完了"]').click
      end.to change { Client.count }.by(0)
      # トップページに遷移する
      visit root_path
    end
  end
  context 'クライアント編集ができないとき' do
    it 'ログインしたユーザーは自分以外が作成したクライアントの編集画面には遷移できない' do
      # クライアント1を作成したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @client1.user.email
      fill_in 'Password', with: @client1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # クライアント1に「お客様メモ」ボタンがあることを確認する
      expect(
        all('.more')[1].hover
      ).to have_link 'お客様メモ', href: client_path(@client1)
      # お客様メモページに遷移する
      visit client_path(@client1)
      # クライアント2に「編集」ボタンがないことを確認する
      expect(
        all('.more')[0].hover
      ).to have_no_link '編集', href: edit_client_path(@client2)
    end
  end
end

RSpec.describe 'クライアント削除', type: :system do
  before do
    @client1 = FactoryBot.create(:client)
    @client2 = FactoryBot.create(:client)
  end
  context 'クライアント削除ができるとき' do
    it 'ログインしたユーザーは自らが作成したクライアントの削除ができる' do
      # クライアント1を作成したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @client1.user.email
      fill_in 'Password', with: @client1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # クライアント1に「お客様メモ」ボタンがあることを確認する
      expect(
        all('.more')[1].hover
      ).to have_link 'お客様メモ', href: client_path(@client1)
      # お客様メモページに遷移する
      visit client_path(@client1)
      # クライアント1に「削除」ボタンがあることを確認する
      expect(
        all('.more')[0].hover
      ).to have_link '削除', href: client_path(@client1)
      # クライアントを削除するとレコードの数が1減ることを確認する
      expect do
        all('.more')[0].hover.find_link('削除', href: client_path(@client1)).click
      end.to change { Client.count }.by(-1)
      # トップページに遷移する
      visit root_path
    end
  end
  context 'クライアント削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したクライアントの削除ができない' do
      # クライアント1を作成したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @client1.user.email
      fill_in 'Password', with: @client1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # クライアント2に「削除」ボタンが無いことを確認する
      expect(
        all('.more')[0].hover
      ).to have_no_link '削除', href: client_path(@client2)
    end
  end
end
