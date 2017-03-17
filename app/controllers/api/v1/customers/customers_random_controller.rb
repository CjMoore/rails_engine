class Api::V1::Customers::CustomersRandomController < ApplicationController

  def show
    @customer = Customer.random
  end
end
