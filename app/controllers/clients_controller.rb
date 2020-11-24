class ClientsController < ApplicationController
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
    client = Client.find(params[:id])
    client.destroy
    redirect_to root_path
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
      @client.valid?
    if @client.update(client_params)
      redirect_to root_path
    else
      render :edit
    end 
  end

  private

  def client_params
    params.require(:client).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :company, :prefecture_id, :birthday).merge(user_id: current_user.id)
  end
end
