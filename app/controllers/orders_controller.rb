class OrdersController < ApplicationController
  def create
    book = Book.find params[:book_id]

    if book.available_items.any?
      item = book.available_items.first
      @order = Order.new user: current_user, item: item, order_date: Time.now

      if @order.save
        redirect_to books_path
      else
        redirect_to book
      end
    else
      redirect_to book
    end
  end
end
