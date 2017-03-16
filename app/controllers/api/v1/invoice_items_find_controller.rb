class Api::V1::InvoiceItemsFindController < ApplicationController

  def index
    if params[:unit_price]
      @invoice_items = InvoiceItem.where(unit_price: format_unit_price(params[:unit_price]))
    else
      @invoice_items = InvoiceItem.where(find_params)
    end
  end

  def show
    if params[:unit_price]
      @invoice_item = InvoiceItem.find_by(unit_price: format_unit_price(params[:unit_price]))
    else
      @invoice_item = InvoiceItem.find_by(find_params)
    end
  end

  private

  def find_params
    params.permit(:item_id, :invoice_id, :merchant_id, :id, :quantity, :unit_price , :created_at, :updated_at)

  end
end
