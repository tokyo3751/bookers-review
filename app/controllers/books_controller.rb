class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

   def book_params
      params.require(:book).permit(:title,:comment)
   end

end
