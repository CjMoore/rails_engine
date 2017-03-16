class Api::V1::Transaction::TransactionsInvoiceController < ApplicationController

  def show
    @invoice = Transaction.find(params[:transaction_id]).invoice
  end

end
