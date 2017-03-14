class Api::V1::MerchantsFindController < ApplicationController

  def index
    render json: Merchant.where(find_params)
  end

  def show
    render json: Merchant.find_by(find_params)
  end

  private
  def find_params
    params.permit(:id,
                  :created_at,
                  :updated_at,
                  :name)
  end
end
