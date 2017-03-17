class Api::V1::Invoices::InvoicesRandomController < ApplicationController

  def show
    @invoice = Invoice.random
  end
end
