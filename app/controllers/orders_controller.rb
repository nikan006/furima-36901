class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderDeliverys.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderDeliverys.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_deliverys).permit(:zip_code, :city, :prefecture_id, :adress1, :adress2, :telephone).merge(user_id: current_user.id, item_id: @item.id)
  end

end
