class Api::V1::CustomersTransactionsController < ApplicationController

  def index
    @transactions = Customer.find(params[:customer_id]).transactions
  end
end
