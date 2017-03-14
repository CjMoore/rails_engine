class Api::V1::InvoicesFindController < ApplicationController

  def index
    key = get_key
    render json: Invoice.get_all_by_key(key, params)
  end

  def show
    key = get_key
    render json: Invoice.get_by_key(key, params)
  end

  private

  def get_key
    params.keys.find do |key|
      [:customer_id, :merchant_id, :id, :status, :created_at, :updated_at].include?(key.downcase.to_sym)
    end
  end

end
