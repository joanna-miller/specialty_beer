class UsersController < ApplicationController
  before_action do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index
    if params[:user_search]
      @searched_user = User.where('lower(email) LIKE ?', "%#{params[:user_search].downcase}%")
    else
      @users = User.all
    end
    render :index
  end

  def show
  @user = User.find(params[:id])
  render :show
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path 
    end     
  end


  private
  def user_params
    params.require(:user).permit(:admin)
  end
end