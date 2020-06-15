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
  end 

  def edit 
  end 

  def update
  end 

  def destroy
  end 

  private

  def book_params
    params.require(:book).permit(:title, :author, :subject)
  end 

  def set_book
    @book = Book.find_by(id: params[:id])
  end 
end
