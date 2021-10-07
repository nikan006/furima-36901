class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to item_orders_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:nickname, :email, :encrypted_password, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date, :name, :text, :image, :price, :category_id, :condition_id, :fee_id, :prefecture_id, :shipping_day_id, :zip_code, :city, :telephone, :adress1)
  end

end
