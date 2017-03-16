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
