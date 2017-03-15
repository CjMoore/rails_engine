require "rails_helper"
require "json"

describe "get show" do
  it "shows merchant's revenue" do
    merchant = Fabricate(:merchant)
    invoice = Fabricate(:invoice, merchant: merchant)
    Fabricate(:invoice_item, invoice: invoice, quantity: 2, unit_price: 1000)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["revenue"]).to eq("20.0")
  end
end
