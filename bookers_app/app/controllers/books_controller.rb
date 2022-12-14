class BooksController < ApplicationController
  def new
  end

  def create
    flash[:notice] = "Book was successfully created."
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end


  def index
    @books = Book.all
    @book = Book.new
  end

 def show
    @book = Book.find(params[:id])
 end

  def edit
     @book = Book.find(params[:id])
  end

  def update
    flash[:notice] = "Book was successfully created."
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    flash[:destroy] = "Book was successfully destroyed."
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
