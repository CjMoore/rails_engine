class Api::V1::Transaction::TransactionsRandomController < ApplicationController
  
  def show
    render json: Transaction.random
  end
end
