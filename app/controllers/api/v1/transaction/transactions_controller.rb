class Api::V1::Transaction::TransactionsController < ApplicationController
  def index
    @transactions =  Transaction.all
  end

  def show
    @transaction =  Transaction.find(params[:id])
  end
end
