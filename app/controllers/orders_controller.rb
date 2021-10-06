class OrdersController < ApplicationController

  def index
    @order = Order.new(order_params)
  end

  def create
  end

end
