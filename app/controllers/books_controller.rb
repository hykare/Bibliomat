class BooksController < ApplicationController
  def index
    @books = Book.search(params[:query])
  end

  def show
    @book = Book.find params[:id]
  end

  def book_params
    params.require(:book).permit(:title, :author, :query)
  end
end