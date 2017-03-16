class Api::V1::CustomersRandomController < ApplicationController
  def show
    render json: Customer.random
  end
end
