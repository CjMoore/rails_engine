class Api::V1::Customers::CustomersController < ApplicationController
  def index
    render json: Customer.all.to_json(except: [:created_at, :updated_at])
  end

  def show
    render json: Customer.find(params[:id])
  end
end
