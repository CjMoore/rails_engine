class Api::V1::ItemsRandomController < ApplicationController
  def show
    render json: Item.random.to_json(only: [:id, :customer_id, :merchant_id, :status])
  end
end
