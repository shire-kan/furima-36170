class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_residence = OrderResidence.new
    redirect_to root_path if !@item.order.nil? || (current_user.id == @item.user_id)
  end

  def create
    @item = Item.find(params[:item_id])
    @order_residence = OrderResidence.new(order_params)
    if @order_residence.valid?
      pay_item
      @order_residence.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_residence)
          .permit(:postal_code,
                  :prefecture_id,
                  :municipality,
                  :address,
                  :building,
                  :phone_number,
                  :token,
                  :authenticity_token,
                  :order_residence,
                  :item_id)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
