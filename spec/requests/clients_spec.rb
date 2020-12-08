require 'rails_helper'
describe ClientsController, type: :request do

  before do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  before do
    @client = FactoryBot.create(:client)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get clients_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのクライアントのlast_nameが存在する" do 
      get clients_path
      expect(response.body).to include @client.last_name
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのクライアントのlast_name_kanaが存在する" do
      get clients_path
      expect(response.body).to include @client.last_name_kana 
    end
    it "indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する" do 
      get root_path
      expect(response.body).to include "お客様を検索"
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get client_path(@client)
      expect(response.status).to eq 200
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクライアントのlast_nameが存在する" do 
      get client_path(@client)
      expect(response.body).to include @client.last_name
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクライアントのlast_name_kanaが存在する" do 
      get client_path(@client)
      expect(response.body).to include @client.last_name_kana
    end
    it "showアクションにリクエストするとレスポンスにお客様のカード部分が存在する" do 
      get client_path(@client)
      expect(response.body).to include "様のカード"
    end
  end 
end