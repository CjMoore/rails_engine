class Api::V1::TransactionsRandomController < ApplicationController
  def show
    render json: Transaction.all.sample
  end
end
