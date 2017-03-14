require 'rails_helper'

describe "invoice record endpoints" do
  it "sends a list of invoices" do
    invoice1, invoice2, invoice3 = Fabricate.times(3, :invoice)
    
    get '/api/v1/invoices'

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)
  end

  it "can get one item by id" do
    invoice_id = Fabricate(:invoice).id

    get "/api/v1/invoices/#{invoice_id}"

    expect(response).to be_success
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(invoice_id)
  end
end
