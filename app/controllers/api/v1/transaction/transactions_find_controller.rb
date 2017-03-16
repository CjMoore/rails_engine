class Api::V1::Transaction::TransactionsFindController < ApplicationController

  def index
    render json: Transaction.where(find_params)
  end

  def show
    render json: Transaction.find_by(find_params)
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
