class Api::V1::InvoicesFindController < ApplicationController

  def index

  end

  def show
    render json: Invoice.get_by_param(params)
  end

end
