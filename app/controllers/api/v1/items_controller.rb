class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all.to_json(only: [:id, :merchant_id, :name, :description, :unit_price])
  end

  def show
    render json: Item.find(params[:id])
  end

end
