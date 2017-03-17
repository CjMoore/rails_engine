class Api::V1::Customers::CustomersFindController < ApplicationController

  def index
    @customers =  Customer.where(find_params)
  end

  def show
    @customer = Customer.find_by(find_params)
  end

  private
  def find_params
    params.permit(:id,
                  :created_at,
                  :updated_at,
                  :first_name,
                  :last_name)
  end
end
