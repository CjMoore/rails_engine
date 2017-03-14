class Api::V1::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItem.all.to_json(only: [:id, :quantity, :item_id, :invoice_id, :unit_price])
  end

  def show
    render json: InvoiceItem.find(params[:id])
  end

end
