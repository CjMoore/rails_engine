class Api::V1::Transaction::TransactionsRandomController < ApplicationController

  def show
    @transaction = Transaction.random
  end
end
