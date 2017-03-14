class Api::V1::TransactionsController < ApplicationController
  def index
    render json: Transaction.all.to_json(only: [:id, :result, :invoice_id, :credit_card_number])
  end

  def show
    render json: Transaction.find(params[:id])
  end
end
