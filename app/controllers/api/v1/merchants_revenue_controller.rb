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
      render json: { "total_revenue" => ((Merchant.total_revenue_on_date(params[:date])/100.00).round(2)).to_s}
    end
  end
end
