class Api::V1::Invoices::InvoicesCustomerController < ApplicationController

  def show
    @customer = Invoice.find(params[:invoice_id]).customer
  end
  
end
