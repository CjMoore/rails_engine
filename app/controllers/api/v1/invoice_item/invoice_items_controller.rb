class Api::V1::InvoiceItem::InvoiceItemsController < ApplicationController

  def index
    @invoice_items = InvoiceItem.all
  end

  def show
    @invoice_item = InvoiceItem.find(params[:id])
  end
end
