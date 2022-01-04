class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    @user = User.find(current_user.id)
    render :index
  end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
