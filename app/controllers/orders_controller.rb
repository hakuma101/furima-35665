class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def donation_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :manicipality, :house_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
