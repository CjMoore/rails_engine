require "rails_helper"

describe "get a merchant's pending customers" do
  it "returns customers with pending invoices" do
    merchant = Fabricate(:merchant)
    customer = Fabricate(:customer)
    invoice = Invoice.create(customer: customer, merchant: merchant, status: "shipped")
    transaction = Fabricate(:transaction, result: "failed", invoice: invoice)

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

    expect(response).to be_success

    customer_response = JSON.parse(response.body)
    
    expect(customer_response.first["id"]).to eq(customer.id)
  end
end
