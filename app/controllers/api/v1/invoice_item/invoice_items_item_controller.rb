class Api::V1::InvoiceItem::InvoiceItemsItemController < ApplicationController
  def show
    @item = InvoiceItem.find(params[:invoice_item_id]).item
  end
end
