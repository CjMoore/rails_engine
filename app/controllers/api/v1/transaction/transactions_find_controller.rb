class Api::V1::Transaction::TransactionsFindController < ApplicationController

  def index
    @transactions = Transaction.where(find_params)
  end

  def show
    @transaction = Transaction.find_by(find_params)
  end

  private

  def find_params
    params.permit(:id,
                  :created_at,
                  :updated_at,
                  :invoice_id,
                  :credit_card_number,
                  :result)
  end
end
