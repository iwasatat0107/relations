class MemosController < ApplicationController
  def create
    memo = Memo.create(memo_params)
    redirect_to "/clients/#{memo.client.id}"
  end

  private
  def memo_params
    params.require(:memo).permit(:text).merge(user_id: current_user.id, client_id: params[:client_id])
  end
end
