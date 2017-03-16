class Api::V1::InvoicesMerchantController < ApplicationController
  def show
    @merchant = Invoice.find(params[:invoice_id]).merchant
  end
end
