require "rails_helper"
require "json"

describe "get show" do
  it "shows merchants by number of items sold" do
    merchant_1 = Fabricate(:merchant)
    merchant_2 = Fabricate(:merchant)
    invoice_1 = Fabricate(:invoice, merchant: merchant_1)
    invoice_2 = Fabricate(:invoice, merchant: merchant_2)
    Fabricate(:invoice_item, invoice: invoice_1, quantity: 2)
    Fabricate(:invoice_item, invoice: invoice_1, quantity: 1)
    Fabricate(:invoice_item, invoice: invoice_2, quantity: 1)

    get "/api/v1/merchants/most_items?quantity=2"

    expect(response).to be_success

    results = JSON.parse(response.body)

    expect(results.count).to eq(2)
    expect(results.first["items_sold"]).to eq(3)
  end
end
