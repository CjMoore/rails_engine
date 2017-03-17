class Api::V1::Merchants::MerchantsRevenueController < ApplicationController

  def show
    if params[:date]
      render json: { "revenue" => format_price_output(Merchant.merchant_revenue_on_date(params[:date], params[:merchant_id])) }

    else
      render json: { "revenue" => format_price_output(Merchant.total_revenue(params[:merchant_id]))}
    end
  end

  def index
    if params[:quantity]
      @merchants = Merchant.with_most_revenue(params[:quantity])
    elsif params[:date]
      render json: { "total_revenue" => format_price_output(Merchant.total_revenue_on_date(params[:date])) }
    end
  end
end
