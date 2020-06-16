class BooksController < ApplicationController
  before_action :set_book, except: [:index, :new, :create]
  before_action :is_logged_in?

  def index 
    @books = current_user.books.all
  end

  def new 
    @book = Book.new
  end 

  def create 
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to book_path(@book)
    else 
      render :new 
    end 
  end 

  def show
  end 

  def edit 
  end 

  def update
    @book.update(book_params)
    redirect_to @book
  end 

  def destroy
    # @book.destroy
    # redirect_to '/'
    if current_user 
      @book.destroy 
      redirect_to '/'
    else 
      redirect_to '/'
    end 
  end 

  private

  def book_params
    params.require(:book).permit(:title, :author, :subject, :user_id)
  end 

  def set_book
    @book = Book.find_by(id: params[:id])
  end 
end
