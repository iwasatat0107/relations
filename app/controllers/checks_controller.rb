class ChecksController < ApplicationController
  def index
    @check = Client.new
    @client = Client.find(params[:client_id])
    @checks = @client.checks.includes(:user).order("created_at DESC")
  end

  def new
    @client = Client.find(params[:client_id])
    @check = Check.new
  end

  def create
    @client = Client.find(params[:client_id])
    @check = Check.new(check_params)
    if @check.valid?
      @check.save
      redirect_to root_path
    else
      render :new
    end 
  end

  private
  def check_params
    params.require(:check).permit(:title, :smile_id, :aizuchi_id, :empathy_id, :reaction_id, :question_id).merge(user_id: current_user.id, client_id: params[:client_id])
  end

end
