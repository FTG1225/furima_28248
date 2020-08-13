class ItemsController < ApplicationController
  before_action :redirect_root, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:images, :name, :description, :category, :status, :shipping_tax, :prefecture, :shipping_date, :price).merge(user_id: current_user.id)
  end

  private

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
end