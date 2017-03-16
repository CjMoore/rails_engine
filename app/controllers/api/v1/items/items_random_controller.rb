class Api::V1::Item::ItemsRandomController < ApplicationController
  def show
    render json: Item.random.to_json(only: [:id, :customer_id, :merchant_id, :status])
  end
end
