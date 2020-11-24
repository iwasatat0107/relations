class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    Client.create(client_params)
  end

  private

  def client_params
    params.require(:client).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :company, :prefecture_id, :birthday).merge(user_id: current_user.id)
  end
end
