class Api::V1::InvoicesFindController < ApplicationController

  def index
    # key = get_key
    render json: Invoice.where(find_params)
  end

  def show
    # key = get_key
    render json: Invoice.find_by(find_params)
  end

  private

  def find_params
    params.permit(:customer_id, :merchant_id, :id, :status, :created_at, :updated_at)
  end

  # def get_key
  #   params.keys.find do |key|
  #     [:customer_id, :merchant_id, :id, :status, :created_at, :updated_at].include?(key.downcase.to_sym)
  #   end
  # end

end
