class Api::V1::InvoiceItem::InvoiceItemsRandomController < ApplicationController

  def show
    @invoice_item = InvoiceItem.random
  end
end
