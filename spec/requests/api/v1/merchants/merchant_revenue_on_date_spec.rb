require 'rails_helper'

describe "when user visits /merchants/revenue" do
  context "and query a date" do
    it "they are returnes total_revenue for all merchants on that date" do
      merchant1, merchant2 = Fabricate.times(2, :merchant)
      invoice = Fabricate(:invoice, merchant: merchant1, created_at: "2012-03-06T16:54:31.000Z")
      invoice_2 = Fabricate(:invoice, merchant: merchant2, created_at: "2012-04-06T16:54:21.000Z")
      Fabricate(:invoice_item, invoice: invoice, quantity: 2, unit_price: 1000)
      Fabricate(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 1000)

      get "/api/v1/merchants/revenue?date=#{invoice.created_at}"

      expect(response).to be_success

      total_revenue = JSON.parse(response.body)

      expect({ "total_revenue" => "20.0"}).to eq(total_revenue)
    end
  end
end
