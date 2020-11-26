class ClientsController < ApplicationController
  before_action :set_client, only: [:destroy, :edit, :update, :show]

  def index
    @clients = Client.all
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
    @client.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
      @client.valid?
    if @client.update(client_params)
      redirect_to root_path
    else
      render :edit
    end 
  end

  def show
  end

  private

  def client_params
    params.require(:client).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :company, :prefecture_id, :birthday).merge(user_id: current_user.id)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
