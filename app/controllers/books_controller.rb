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
        redirect_to @book
      else 
        render :new 
      end 
    end 

    # def show
    #   @book = Book.find(params[:id])
    # end 

    private

    def book_params
      params.require(:book).permit(:title, 
      :author,
      :subject)
    end     
  end