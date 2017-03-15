class Api::V1::MerchantsRevenueController < ApplicationController
  def show
    if params[:date]
      @revenue = Merchant.with_invoices.find(params[:merchant_id]).total_revenue(params[:date])
    else
      @revenue = Merchant.with_invoices.find(params[:merchant_id]).total_revenue
    end
  end

  def index
    @merchants = Merchant.with_most_revenue(params[:quantity])
  end
end
