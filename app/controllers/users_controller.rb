class UsersController < ApplicationController
  before_action :ensure_current_user, only:[:edit, :destroy]

  def new
    @book = Book.new
  end

  def create
    @user = User.new(user_paramas)
    if @user.save
      redirect_to user_path
    else
      render new_user_registration_path
    end
  end

  def index
    @users = User.all
    @user = current_user
    @new_book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_paramas)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  private

  def user_paramas
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_current_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end
end
