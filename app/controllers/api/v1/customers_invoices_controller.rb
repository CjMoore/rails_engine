class Api::V1::CustomersInvoicesController < ApplicationController

  def index
    @invoices = Customer.find(params[:customer_id]).invoices
  end

end
