class Api::V1::Invoices::InvoicesMerchantController < ApplicationController

  def show
    @merchant = Invoice.find(params[:invoice_id]).merchant
  end
  
end
