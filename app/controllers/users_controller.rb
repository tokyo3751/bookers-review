class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @books = Book.where(user_id: @user.id)
    @user = User.find(params[:id])
  end

  def edit
  end

  private
   def user_params
     params.require(:user).permit(:name,:email,:image)
   end
end
