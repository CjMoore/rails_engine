class Api::V1::InvoiceItemsFindController < ApplicationController

  def index
    key = get_key
    render json: InvoiceItem.get_all_by_key(key, params)
  end

  def show
    key = get_key
    render json: InvoiceItem.get_by_key(key, params)
  end

  private

  def get_key
    params.keys.find do |key|
      [:item_id, :invoice_id, :merchant_id, :id, :quantity, :unit_price , :created_at, :updated_at].include?(key.downcase.to_sym)
    end
  end

end
