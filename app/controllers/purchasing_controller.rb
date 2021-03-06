class PurchasingController < ApplicationController
  def show
    @purchasing = Parchasing.find(params[:id])
  end
end
