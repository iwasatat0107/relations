require 'rails_helper'

RSpec.describe 'チェック開始', type: :system do
  before do
    @client1 = FactoryBot.create(:client)
    @client2 = FactoryBot.create(:client)
    @check = FactoryBot.create(:check)
    sleep(1)
  end
  context 'チェックができるとき' do
    it 'ログインしたユーザーは自らが作成したクライアントでチェックができる' do
      # クライアント1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @client1.user.email
      fill_in 'Password', with: @client1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # クライアント1に「セルフチェック」のボタンがあることを確認する
      expect(
        all('.more')[2].hover
      ).to have_link 'セルフチェック', href: client_checks_path(@client1)
      # チェックページに移動する
      visit client_checks_path(@client1)
      # クライアント1に「セルフチェック開始」ボタンがあることを確認する
      expect(
        all('.item')[1].hover
      ).to have_link 'セルフチェック開始', href: new_client_check_path(@client1)
      # チェックページに移動する
      visit new_client_check_path(@client1)
      # フォームに情報を入力する
      fill_in 'check_title', with: @check_title
      find('#check_smile_id').find("option[value='1']").select_option
      find('#check_aizuchi_id').find("option[value='1']").select_option
      find('#check_empathy_id').find("option[value='1']").select_option
      find('#check_reaction_id').find("option[value='1']").select_option
      find('#check_question_id').find("option[value='1']").select_option
      # 送信するとCheckモデルのカウントが上がらないことを確認する
      expect do
        find('input[value="保存"]').click
      end.to change { Check.count }.by(0)
      # チェックページに遷移する
      visit client_checks_path(@client1)
      # チェックページには先ほど投稿した内容のチェックが存在することを確認する
      expect(page).to have_content @check_title
    end
  end
  context 'チェックができないとき' do
    it 'ログインしていないとチェックページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # クライアント2を作成したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @client2.user.email
      fill_in 'Password', with: @client2.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # クライアント1を作成したユーザー以外にはチェックページへのリンクがない
      expect(
        all('.more')[0].hover
      ).to have_no_link 'セルフチェック', href: client_checks_path(@client1)
    end
  end
end

RSpec.describe 'チェック削除', type: :system do
  before do
    @client1 = FactoryBot.create(:client)
    @client2 = FactoryBot.create(:client)
    @check = FactoryBot.create(:check)
    sleep(1)
  end
  context 'チェックが削除ができるとき' do
    it 'ログインしたユーザーは自らが作成したチェックの削除ができる' do
      # クライアント1を作成したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @client1.user.email
      fill_in 'Password', with: @client1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # クライアント1に「セルフチェック」のボタンがあることを確認する
      expect(
        all('.more')[2].hover
      ).to have_link 'セルフチェック', href: client_checks_path(@client1)
      # チェックページに移動する
      visit client_checks_path(@client1)
      # クライアント1に「セルフチェック開始」ボタンがあることを確認する
      expect(
        all('.item')[1].hover
      ).to have_link 'セルフチェック開始', href: new_client_check_path(@client1)
      # チェックページに移動する
      visit new_client_check_path(@client1)
      # フォームに情報を入力する
      fill_in 'check_title', with: @check_title
      find('#check_smile_id').find("option[value='1']").select_option
      find('#check_aizuchi_id').find("option[value='1']").select_option
      find('#check_empathy_id').find("option[value='1']").select_option
      find('#check_reaction_id').find("option[value='1']").select_option
      find('#check_question_id').find("option[value='1']").select_option
      # 送信するとCheckモデルのカウントが上がらないことを確認する
      expect do
        find('input[value="保存"]').click
      end.to change { Check.count }.by(0)
      # トップページに遷移する
      visit client_checks_path(@client1)

      # トップページに遷移する
      visit root_path
      # クライアント1に「セルフチェック」ボタンがあることを確認する
      expect(
        all('.more')[2].hover
      ).to have_link 'セルフチェック'
    end
  end
  context 'チェックの削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したセルフチェックの削除ができない' do
      # クライアント1を作成していないユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @client2.user.email
      fill_in 'Password', with: @client2.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # クライアント2に「セルフチェック」ボタンが無いことを確認する
      expect(
        all('.more')[0].hover
      ).to have_no_link 'セルフチェック'
    end
  end
end
