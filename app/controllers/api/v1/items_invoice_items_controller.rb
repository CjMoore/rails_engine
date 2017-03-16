class Api::V1::ItemsInvoiceItemsController< ApplicationController
  def index
    @invoice_items = Item.find(params[:item_id]).invoice_items
  end

end
