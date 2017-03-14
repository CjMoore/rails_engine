class Api::V1::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItem.all.to_json(only: [:id, :customer_id, :merchant_id, :status])
  end

  def show
    render json: InvoiceItem.find(params[:id])
  end

end
