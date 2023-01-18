class OrdersController < ApplicationController
  def create
    book = Book.find params[:book_id]

    if book.available_items.any?
      item = book.available_items.first
      @order = Order.new user: current_user, item: item, order_date: Time.now

      if @order.save
        puts "order successful"
        redirect_to books_path
      else
        puts "order wasn't saved"
        redirect_to book
      end
    else
      puts "no available items"
      redirect_to book
    end
  end
end
