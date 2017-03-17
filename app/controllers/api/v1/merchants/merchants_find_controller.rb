class Api::V1::Merchants::MerchantsFindController < ApplicationController

  def index
    @merchants = Merchant.where(find_params)
  end

  def show
    @merchant = Merchant.find_by(find_params)
  end

  private
  def find_params
    params.permit(:id,
                  :created_at,
                  :updated_at,
                  :name)
  end
end
