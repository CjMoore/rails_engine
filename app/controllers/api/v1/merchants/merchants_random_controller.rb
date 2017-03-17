class Api::V1::Merchants::MerchantsRandomController < ApplicationController
  
  def show
    @merchant = Merchant.random
  end
end
