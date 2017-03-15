class Api::V1::CustomersFavoriteMerchantController < ApplicationController

  def show
    customer = Customer.find(params[:customer_id])
    @merchant = Customer.favorite_merchant(customer)
  end

end
