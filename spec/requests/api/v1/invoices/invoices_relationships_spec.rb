require "rails_helper"

describe "get all transactions for an invoice" do
  it "returns all associated transactions" do
    invoice = Fabricate(:invoice, transactions: [])
    transaction_1 = Fabricate(:transaction, invoice: invoice)
    transaction_2 = Fabricate(:transaction, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success

    transaction_response = JSON.parse(response.body)

    expect(transaction_response.first["id"]).to eq(transaction_1.id)
    expect(transaction_response.last["id"]).to eq(transaction_2.id)
  end
end

describe "get all invoice_items for an invoice" do
  it "returns all associated invoice_items" do
    invoice = Fabricate(:invoice)
    invoice_item_1 = Fabricate(:invoice_item, invoice: invoice)
    invoice_item_2 = Fabricate(:invoice_item, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_success

    invoice_item_response = JSON.parse(response.body)

    expect(invoice_item_response.first["id"]).to eq(invoice_item_1.id)
    expect(invoice_item_response.last["id"]).to eq(invoice_item_2.id)
  end
end
