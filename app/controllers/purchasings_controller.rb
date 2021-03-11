class PurchasingsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    @purchasing = FormObject.new
  end

  def create
    @purchasing = FormObject.new(purchasing_params)
    if @purchasing.valid?
      pay_item
      @purchasing.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchasing_params
    params.require(:form_object).permit(:item_id, :user_id, :postcode, :prefecture_id, :town, :house_number, :building_name, :phone).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchasing_params[:token],    
      currency: 'jpy' 
    )
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end
