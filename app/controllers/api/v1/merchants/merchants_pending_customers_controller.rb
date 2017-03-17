class Api::V1::Merchants::MerchantsPendingCustomersController < ApplicationController

  def index
    @customers = Merchant.find(params[:merchant_id]).pending_customers
  end
end
