class Api::V1::MerchantsFavoriteCustomerController < ApplicationController

  def show
    merchant = Merchant.find(params[:merchant_id])
    render json: Merchant.get_favorite_customer(merchant)
  end

end
