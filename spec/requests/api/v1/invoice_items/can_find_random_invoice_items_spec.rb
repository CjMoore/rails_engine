require 'rails_helper'

describe "when user visits invoice_items/random" do
  it "they are able to get a random invoice_item" do
    customer = Fabricate(:customer)
    invoice_item1= Fabricate( :invoice_item )

    get "/api/v1/invoice_items/random"

    expect(response).to be_success

    invoice_item_response = JSON.parse(response.body)

    expect(invoice_item1.id).to eq(invoice_item_response["id"])
  end
end
