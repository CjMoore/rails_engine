class Api::V1::InvoicesRandomController < ApplicationController
  def show
    render json: Invoice.random.to_json(only: [:id, :customer_id, :merchant_id, :status])
  end
end
