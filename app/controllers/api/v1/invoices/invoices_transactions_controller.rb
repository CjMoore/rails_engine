class Api::V1::Invoices::InvoicesTransactionsController< ApplicationController

  def index
    @transactions = Invoice.find(params[:invoice_id]).transactions
  end
end
