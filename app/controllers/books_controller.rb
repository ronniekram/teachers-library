  class BooksController < ApplicationController

    def index 
      @books = Book.all.alphabet
    end

    def new 
      @book = Book.new
    end 

    def create 
      @book = Book.find_or_create_by(book_params)
      if @book.save
        redirect_to books_path
      else 
        render :new 
      end 
    end 

    private

    def book_params
      params.require(:book).permit(:title, :author)
    end     
  end