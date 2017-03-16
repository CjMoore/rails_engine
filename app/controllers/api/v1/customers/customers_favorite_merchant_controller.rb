class Api::V1::CustomersFavoriteMerchantController < ApplicationController

  def show
    # customer = Customer.find(params[:customer_id])
    render json: Customer.favorite_merchant(params[:customer_id]).first
  end

end
