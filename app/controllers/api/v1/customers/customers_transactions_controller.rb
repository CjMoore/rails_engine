class Api::V1::Customers::CustomersTransactionsController < ApplicationController

  def index
    @transactions = Customer.find(params[:customer_id]).transactions
  end
end
