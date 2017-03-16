class Api::V1::InvoiceItem::InvoiceItemsRandomController < ApplicationController
  def show
    render json: InvoiceItem.random.to_json(only: [:id, :item_id, :invoice_id, :quantity, :unit_price])
  end
end
