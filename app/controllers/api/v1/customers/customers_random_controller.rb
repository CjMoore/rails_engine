class Api::V1::Customers::CustomersRandomController < ApplicationController
  def show
    render json: Customer.random
  end
end
