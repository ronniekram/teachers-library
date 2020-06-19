class BooksController < ApplicationController
  before_action :set_book, except: [:index, :new, :create]

  def index 
    @books = current_user.books.all
  end

  def new 
    @book = Book.new
    @book.subjects.build
  end 

  def create 
    @book = current_user.books.build(book_params)
    if @book.save
      redirect
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
    if @book.save 
      redirect
    else 
      render :edit 
    end 
  end 

  def destroy
    @book.destroy
    redirect_to user_books_path(current_user)
  end 

  private

  def book_params
    params.require(:book).permit(:title, 
     :author,
     :subject, 
     :user_id, 
     :subject_ids => [],
     subjects_attributes: [:name]
      )
  end 

  def set_book
    @book = Book.find(params[:id])
  end 

  def redirect 
    redirect_to user_book_path(current_user, @book)
  end 
end
