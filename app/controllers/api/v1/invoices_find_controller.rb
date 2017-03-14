class Api::V1::InvoicesFindController < ApplicationController

  def index
    render json: Invoice.get_all_by_params(params)
  end

  def show
    render json: Invoice.get_by_param(params)
  end

end
