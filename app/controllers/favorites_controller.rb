class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(client_id: params[:client_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @client = Client.find(params[:client_id])
    @favorite = current_user.favorites.find_by(client_id: @client.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
