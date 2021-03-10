class PurchasingsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchasing = FormObject.new
  end

  def create
    @purchasing = FormObject.new(purchasing_params)
    if @purchasing.valid?
      @purchasing.save
      redirect_to item_purchasings_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

 def purchasing_params
  params.require(:form_object).permit(:item_id, :user_id, :postcode, :prefecture_id, :town, :house_number, :building_name, :phone)
 end
end
