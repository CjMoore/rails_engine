class Api::V1::MerchantsRevenueController < ApplicationController
  def show
    @merchant = Merchant.with_invoices.find(params[:merchant_id])
  end
end
