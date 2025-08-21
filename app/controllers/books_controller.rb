class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy ] 
    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        # debugger
        # @book = Book.new(title: params[:book][:title], body: params[:book][:body] ) 

        if @book.save
            redirect_to books_path, notice: "The Books was created succesfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        # @book = Book.find(params[:id])
    end 

    def edit
        #  @book = Book.find(params[:id])
    end 

    def update
        #  @book = Book.find(params[:id])
         if @book.update(book_params)
            redirect_to book_path(@book), notice: "Book updated succesfully"
         else
            render :edit
         end
    end

    def destroy
        #  @book = Book.find(params[:id])
         @book.destroy
         redirect_to books_path, notice: "Book was successfully deleted."
    end


    private
    def book_params
        params.require(:book).permit(:title, :body, :book_image, :author_id )
        # params.permit(:title, :author)
    end

    def set_book
        @book = Book.find(params[:id])
    end

end 