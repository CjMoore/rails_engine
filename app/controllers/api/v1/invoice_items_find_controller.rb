class Api::V1::InvoiceItemsFindController < ApplicationController

  def index
    @invoice_items = InvoiceItem.where(find_params)
  end

  def show
    @invoice_item = InvoiceItem.find_by(find_params)
  end

  private

  def find_params
    params.permit(:item_id, :invoice_id, :merchant_id, :id, :quantity, :unit_price , :created_at, :updated_at)

  end
end
