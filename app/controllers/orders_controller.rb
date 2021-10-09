class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderDeliverys.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderDeliverys.new(order_params)
    if @order.valid?
       pay_item
       @order.save
       return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_deliverys).permit(:zip_code, :city, :prefecture_id, :adress1, :adress2, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end
