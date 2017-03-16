require "rails_helper"

describe "when user requests /merchants/:id/invoice" do
  it "they are returned the invoice info associated with that transaction" do
    transaction = Fabricate(:transaction)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_success

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(transaction.invoice.id)
  end
end
