class BooksController < ApplicationController

  def create
    @user = current_user
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@new_book)
    else
      flash[:alret] = "投稿に失敗しました。"
      @books = Book.all
      render "index"
    end
  end

  def index
    @new_book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @user = current_user
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "変更に成功しました。"
      redirect_to book_path(@book)
    else
      flash[:alert] = "変更に失敗しました。"
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:alret] = "削除に成功しました。"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
