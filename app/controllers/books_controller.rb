  class BooksController < ApplicationController
    before_action :set_book, except: [:index, :new, :create]
    def index 
      @books = Book.search(params[:search]).alphabet
    end

    def new 
      @book = Book.new
      @book.subjects.build
    end 

    def create 
      @book = Book.create(book_params)
      if @book.save
        redirect_to @book
      else 
        render :new 
      end 
    end 

    def show
    end 

    def edit
    end 

    def update
      if @book.update(book_params) 
        redirect_to @book
      else 
        render :edit
      end 
    end 

    private

    def book_params
      params.require(:book).permit(:title, 
      :author, 
      :publisher,
      :pages,
      :subject_ids,
      :subject_attributes => [:sub_name])
    end  
    
    def set_book 
      @book = Book.find_by(id: params[:id])
    end 

  end