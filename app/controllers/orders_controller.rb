class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order = OrderDeliverys.new
    if current_user == @item.user or @item.order.present?
      redirect_to root_path
    end
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end
end
