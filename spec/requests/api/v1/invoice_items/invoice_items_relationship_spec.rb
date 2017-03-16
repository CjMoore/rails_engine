require "rails_helper"

describe "gets invoice for invoice_item" do
  it "should return the associated invoice" do
    invoice = Fabricate(:invoice)
    invoice_item = Fabricate(:invoice_item, invoice: invoice)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_success

    invoice_response = JSON.parse(response.body)

    expect(invoice_response["id"]).to eq(invoice.id)
  end
end
