class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update, :show]
  before_action :move_to_index, except: [:index, :search]

  def index
    @clients = Client.includes(:user).order('created_at DESC')
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.create(client_params)
    if @client.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    client = Client.find(params[:id])
    client.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @client.valid?
    if @client.update(client_params)
      redirect_to "/clients/#{@client.id}"
    else
      render :edit
    end
  end

  def show
    @memo = Memo.new
    @memos = @client.memos.includes(:user)
  end

  def search
    @clients = Client.search(params[:keyword])
  end

  private

  def client_params
    params.require(:client).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :company, :prefecture_id,
                                   :birthday, :image).merge(user_id: current_user.id)
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
