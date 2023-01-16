class BooksController < ApplicationController
  def index
    @books = Book.search(params[:query])

  end

  def book_params
    params.require(:book).permit(:title, :author, :query)
  end
end