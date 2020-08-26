class ItemPurchaseController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def new
    @purchase = Purchase.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      # binding.pry
      render :index
    end
  end

  def purchase_params
    # binding.pry
    params.require(:purchase).permit(:item_id, :user_id, :token, :zip_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: params[:purchase][:price],
      card: params[:token],
      currency: 'jpy'
    )
  end
end
