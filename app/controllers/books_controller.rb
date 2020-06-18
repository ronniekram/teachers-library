class BooksController < ApplicationController
  before_action :set_book, except: [:index, :new, :create]

  def index 
    @books = current_user.books.all
  end

  def new 
    #inital object
    @book = Book.new
    #associated object
    @book.subjects.build
  end 

  def create 
    @book = current_user.books.build(book_params)
    if @book.save
      # redirect_to user_book_path(current_user, @book)
      redirect
    else 
      #redirect loses error messages
      render :new 
    end 
  end 

  def show
  end 

  def edit 
  end 

  def update
    @book.update(book_params)
    # redirect_to user_book_path(current_user, @book)
    if @book.save 
      redirect
    else 
      render :edit 
    end 
  end 

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_books_path(current_user)
  end 

  private

  def book_params
    params.require(:book).permit(:title, 
     :author,
     :subject, 
     :user_id, 
     subjects_attributes: [:name]
      )
  end 

  def set_book
    #comes from URI '/locations/:id/' dynamic route - dynamic field is param
    @book = Book.find(params[:id])
  end 

  def redirect 
    redirect_to user_book_path(current_user, @book)
  end 
end
