require 'rails_helper'

describe "when user visits merchant/most_revenue?quantity and enter quantity" do
  it "they are returned that number of merchants in order of highest revenue" do
    merchant1, merchant2, merchant3 = Fabricate.times(3, :merchant)
    invoice1 = Fabricate(:invoice, merchant: merchant1)
    invoice2 = Fabricate(:invoice, merchant: merchant2)
    invoice3 = Fabricate(:invoice, merchant: merchant3)
    Fabricate(:invoice_item, invoice: invoice1)
    Fabricate(:invoice_item, invoice: invoice2)
    Fabricate(:invoice_item, invoice: invoice3)

    get '/api/v1/merchants/most_revenue?quantity=2'

    expect(response).to be_success

    merchant_response1 = JSON.parse(response.body).first
    merchant_response2 = JSON.parse(response.body).last

    expect(merchant_response1["id"]).to eq(merchant1.id)
    expect(merchant_response2["id"]).to eq(merchant2.id)
    expect(merchant_response2["id"]).to_not eq(merchant3.id)
  end
end
