  class BooksController < ApplicationController

    def index 
      @books = current_user.books.alphabet
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
      @book = Book.find(params[:id])
    end 

    private

    def book_params
      params.require(:book).permit(:title, 
      :author,
      :subject
        )
    end     
  end