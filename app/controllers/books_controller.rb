class BooksController < ApplicationController
  before_action :verified, except: [:index, :show]
  before_action :set_book, except: [:index, :new, :create]

  def index 
    @books = Book.all
  end 

  def show
  end 
  
  def new 
    @book = Book.new
  end 

  def create 
    book = Book.create(book_params)
    redirect_to book_path(book.id)
  end 

  def edit 
  end 

  def update
    @book.update(book_params)
    @book.save
    redirect_to book_path(@book)
  end 

  def destroy
    @book.destroy unless !current_user
    redirect_to user_path(current_user)
  end 

  private

  def book_params
    params.require(:book).permit(:title, :author, :subject)
  end 

  def set_book
    @book = Book.find_by(id: params[:id])
  end 
end
