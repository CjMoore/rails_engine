class Api::V1::Invoices::InvoicesController < ApplicationController

  def index
    render json: Invoice.all.to_json(only: [:id, :customer_id, :merchant_id, :status])
  end

  def show
    render json: Invoice.find(params[:id])
  end

end
