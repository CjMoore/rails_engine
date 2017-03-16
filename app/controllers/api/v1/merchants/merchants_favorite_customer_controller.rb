class Api::V1::Merchants::MerchantsFavoriteCustomerController < ApplicationController

  def show
    render json: Merchant.find(params[:merchant_id]).get_favorite_customer
  end

end
