class Api::V1::Merchants::MerchantsController < ApplicationController
  def index
    render json: Merchant.all.to_json(only: [:id, :name])
  end

  def show
    render json: Merchant.find(params[:id])
  end
end
