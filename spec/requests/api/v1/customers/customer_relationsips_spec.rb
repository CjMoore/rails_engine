require "rails_helper"

describe "when user requests customer relationship routes" do
  context "for transactions" do
    it "api responds with all transactions associated with that customer" do
      customer = Fabricate(:customer)
      invoice1 = Fabricate(:invoice, customer: customer)
      invoice2 = Fabricate(:invoice, customer: customer)

      get "/api/v1/customers/#{customer.id}/transactions"

      expect(response).to be_success

      transaction_response = JSON.parse(response.body)

      expect(transaction_response.first["id"]).to eq(invoice1.transactions.first.id)
      expect(transaction_response.last["id"]).to eq(invoice2.transactions.last.id)
    end
  end

  context "for invoices" do
    it "api responds with all invoices associated with that customer" do
      customer = Fabricate(:customer)
      invoice1, invoice2 = Fabricate.times(2, :invoice, customer: customer)

      get "/api/v1/customers/#{customer.id}/invoices"

      expect(response).to be_success

      invoice_response = JSON.parse(response.body)

      expect(invoice_response.first["id"]).to eq(invoice1.id)
      expect(invoice_response.last["id"]).to eq(invoice2.id)
    end
  end
end
