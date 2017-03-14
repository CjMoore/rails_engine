require 'rails_helper'

describe "when user visits invoices/random" do
  it "they are able to get a random invoice" do
    customer = Fabricate(:customer)
    invoice1= Fabricate( :invoice )

    get "/api/v1/invoices/random"

    expect(response).to be_success

    invoice_response = JSON.parse(response.body)

    expect(invoice1.id).to eq(invoice_response["id"])
  end
end
