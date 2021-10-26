class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    unless Item.find(params[:id]).user.id == current_user.id
      redirect_to action: :show
    end
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path
    else
      @item = Item.new(item_params)
      render :edit
    end
  end

  private

  def item_params
    params.require(:item)
          .permit(:title,
                  :content,
                  :price,
                  :condition_id,
                  :shipping_id,
                  :prefecture_id,
                  :deliverydays_id,
                  :category_id,
                  :image)
          .merge(user_id: current_user.id)
  end
end
