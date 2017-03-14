class Api::V1::CustomersController < ApplicationController
  def index
    render json: Customer.all.to_json(only: [:id, :first_name, :last_name])
  end

  def show
    render json: Customer.find(params[:id])
  end
end
