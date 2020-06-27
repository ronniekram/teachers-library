  class BooksController < ApplicationController
    before_action :set_book, except: [:index, :new, :create]
    def index 
      @books = Book.all.alphabet
    end

    def new 
      @book = Book.new
    end 

    def create 
      @book = Book.create(book_params)
      if @book.save
        redirect_to books_path
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

    private

    def book_params
      params.require(:book).permit(:title, :author, :publisher, :pages)
    end  
    
    def set_book 
      @book = Book.find_by(id: params[:id])
    end 
  end