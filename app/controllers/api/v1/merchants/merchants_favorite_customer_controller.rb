class Api::V1::Merchants::MerchantsFavoriteCustomerController < ApplicationController

  def show
    @customer = Merchant.find(params[:merchant_id]).get_favorite_customer
  end
end
