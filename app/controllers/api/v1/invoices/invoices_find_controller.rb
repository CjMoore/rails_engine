class Api::V1::Invoices::InvoicesFindController < ApplicationController

  def index
    @invoices = Invoice.where(find_params)
  end

  def show
    @invoice = Invoice.find_by(find_params)
  end

  private

  def find_params
    params.permit(:customer_id, :merchant_id, :id, :status, :created_at, :updated_at)
  end

end
