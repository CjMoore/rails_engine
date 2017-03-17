class Api::V1::Invoices::InvoicesItemsController< ApplicationController

  def index
    @items = Invoice.find(params[:invoice_id]).items
  end
end
