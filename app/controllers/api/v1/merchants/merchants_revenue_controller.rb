class Api::V1::Merchants::MerchantsRevenueController < ApplicationController

  def show
    if params[:date]
      render json: { "revenue" => (Merchant.merchant_revenue_on_date(params[:date], params[:merchant_id])/100.00).round(2).to_s }

    else
      render json: { "revenue" => (Merchant.total_revenue(params[:merchant_id])/100.00).round(2).to_s}
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
