class Api::V1::InvoicesCustomerController < ApplicationController
  def show
    @customer = Invoice.find(params[:invoice_id]).customer
  end
end
