class ItemPurcahseController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @purcahse = ItemPurcahse.new
  end

  def new
    @purcahse = ItemPurcahse.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purcahse = ItemPurcahse.new(purcahse_params)
    if @purcahse.valid?
      pay_item
      @purcahse.save
      redirect_to root_path
    else
      render :index
    end
  end

  def purcahse_params
    params.require(:item_purcahse).permit(:item_id, :user_id, :price, :token, :zip_code, :prefecture, :city, :house_number, :building_name, :phone_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purcahse_params[:price],
      card: purcahse_params[:token],
      currency: 'jpy'
    )
  end
end