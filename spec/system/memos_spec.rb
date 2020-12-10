require 'rails_helper'

RSpec.describe 'メモ記録', type: :system do
  before do
    @client = FactoryBot.create(:client)
    @memo = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーはクライアントページでメモできる' do
    # ログインする
    visit new_user_session_path
    fill_in 'Email', with: @client.user.email
    fill_in 'Password', with: @client.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # クライアントに「お客様メモ」ボタンがあることを確認する
    expect(
      all(".more")[0].hover
    ).to have_link 'お客様メモ', href: client_path(@client)
    # お客様メモページに遷移する
    visit client_path(@client)
    # フォームに情報を入力する
    fill_in 'memo_text', with: @memo
    # メモを記録すると、Memoモデルのカウントが1上がることを確認する
    expect{
      find('input[value="記録"]').click
    }.to change { Memo.count }.by(1)
    # メモページにリダイレクトされることを確認する
    expect(current_path).to eq client_path(@client)
    # メモページ上に先ほどのメモ内容が含まれていることを確認する
    expect(page).to have_content @memo
  end
end