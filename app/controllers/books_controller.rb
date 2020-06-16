class BooksController < ApplicationController
  before_action :verified

  def index 
      @user = User.find_by(id: params[:user_id])
      @books = @user.books.all
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:id])
      @book = @user.books.find_by(id: params[:user_id])
      redirect_to user_book_path(@user, @book)
    else 
      redirect_to '/'
    end
  end 

  def new 
    @book = Book.new
  end 

  def create 
    user = User.find_by(id: params[:id])
    book = user.books.build(book_params)
    book.save
    if book 
      redirect_to user_book_path(book)
    else 
      render :new
    end 
  end 


  def edit 
  end 

  def update
    @book.update(book_params)
    redirect_to book_path(@book)
  end 

  def destroy
    @book.destroy
    redirect_to books_path
  end 

  private

  def book_params
    params.require(:book).permit(:title, :author, :subject, :user_id)
  end 

  def set_book
    @book = Book.find(params[:id])
  end 
end
