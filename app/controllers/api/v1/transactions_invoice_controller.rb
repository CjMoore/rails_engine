class Api::V1::TransactionsInvoiceController < ApplicationController

  def show
    @invoice = Transaction.find(params[:transaction_id]).invoice
  end

end
