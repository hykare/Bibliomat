class OrdersController < ApplicationController


  def create
    # book -> free items -> first

    # item = params[:]
    # user = current_user
    # @order = Order.new order_params
  end

  private

  def order_params
    # params.require(:order).permit(:user_id, :)
  end

  # t.belongs_to :user
  # t.belongs_to :item
  # t.datetime :order_date
  # t.datetime :delivery_date
  # t.datetime :pickup_date
  # t.datetime :return_date
end

# book_id
# current_user