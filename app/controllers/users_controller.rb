class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
  end

  def edit
  end

  private
   def user_params
     params.require(:user).permit(:name,:email,:image)
   end
end
