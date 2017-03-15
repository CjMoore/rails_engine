class Api::V1::MerchantsRevenueController < ApplicationController
  def show
    if params[:date]
      @revenue = Merchant.with_invoices.find(params[:merchant_id]).total_revenue(params[:date])
    else
      @revenue = Merchant.with_invoices.find(params[:merchant_id]).total_revenue
    end
  end

  def index
    if params[:quantity]
      @merchants = Merchant.with_most_revenue(params[:quantity])
    elsif params[:date]
      @merchants = Merchant.total_revenue_on_date(params[:date])
    end
  end
end
