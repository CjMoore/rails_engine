class Api::V1::InvoicesInvoiceItemsController< ApplicationController
  def index
    @invoice_items = Invoice.find(params[:invoice_id]).invoice_items
  end

end
