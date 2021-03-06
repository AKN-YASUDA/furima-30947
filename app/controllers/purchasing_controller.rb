class PurchasingController < ApplicationController
  def show
    @purchasing = Parchasing.order(created_at: :desc)
  end
end
