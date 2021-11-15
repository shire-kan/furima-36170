class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_residence = OrderResidence.new
    redirect_to root_path if !@item.order.nil? || (current_user.id == @item.user_id)
  end

  def create
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

  def set_item
    @item = Item.find(params[:id])
  end

  def order_params
    params.require(:order_residence)
          .permit(:postal_code,
                  :prefecture_id,
                  :municipality,
                  :address,
                  :building,
                  :phone_number,
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
