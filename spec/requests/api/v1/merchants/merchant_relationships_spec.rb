require "rails_helper"

describe "when user requests merchant relationship routes" do
  context "for items" do
    it "api responds with all items associated with that merchant" do
      merchant = Fabricate(:merchant)
      item1, item2 = Fabricate.times(2, :item, merchant: merchant)

      get "/api/v1/merchants/#{merchant.id}/items"

      expect(response).to be_success

      item_response = JSON.parse(response.body)

      expect(item_response.first["id"]).to eq(item1.id)
      expect(item_response.last["id"]).to eq(item2.id)
    end
  end

  context "for invoices" do
    it "api responds with all invoices associated with that merchant" do
      merchant = Fabricate(:merchant)
      invoice1, invoice2 = Fabricate.times(2, :invoice, merchant: merchant)

      get "/api/v1/merchants/#{merchant.id}/invoices"

      expect(response).to be_success

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoice1.id)
      expect(invoice_response.last["id"]).to eq(invoice2.id)
    end
  end
end
