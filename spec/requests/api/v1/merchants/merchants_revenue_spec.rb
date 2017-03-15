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

  it "shows merchant's revenue on a date" do
    merchant = Fabricate(:merchant)
    invoice = Fabricate(:invoice, merchant: merchant, created_at: "2012-03-06T16:54:31.000Z")
    invoice_2 = Fabricate(:invoice, merchant: merchant, created_at: "2012-04-06T16:54:21.000Z")
    Fabricate(:invoice_item, invoice: invoice, quantity: 2, unit_price: 1000)
    Fabricate(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 1000)

    get "/api/v1/merchants/#{merchant.id}/revenue?date=#{invoice.created_at}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["revenue"]).to eq("20.0")
  end
end
