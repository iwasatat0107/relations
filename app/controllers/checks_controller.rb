class ChecksController < ApplicationController
  before_action :set_check, only: [:index, :new, :create]
  before_action :move_to_index, except: :index

  def index
    @check = Client.new
    @checks = @client.checks.includes(:user).order("created_at DESC")
  end

  def new
    @check = Check.new
  end

  def create
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

  def set_check
    @client = Client.find(params[:client_id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @client.user_id
      redirect_to action: :index
    end
  end

end
