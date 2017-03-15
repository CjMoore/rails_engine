require  "rails_helper"

describe "get show" do
  it "returns the most common merchant" do
    merchant = Fabricate(:merchant)
    customer = Fabricate(:customer)
    invoice1 = Fabricate(:invoice, merchant: merchant, customer: customer)
    Fabricate.times(3, :transaction, invoice: invoice1)

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(response).to be_success

    merchant_response = JSON.parse(response.body)

    expect(merchant_response["id"]).to eq(merchant.id)
  end

  it "does not show other merchants" do
    merchant = Fabricate(:merchant)
    merchant_2 = Fabricate(:merchant)
    customer = Fabricate(:customer)
    invoice1 = Fabricate(:invoice, merchant: merchant, customer: customer)
    invoice2 = Fabricate(:invoice, merchant: merchant_2, customer: customer)
    Fabricate(:transaction, invoice: invoice2)
    Fabricate.times(3, :transaction, invoice: invoice1)

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(response).to be_success

    merchant_response = JSON.parse(response.body)

    expect(merchant_response["id"]).to eq(merchant.id)
    expect(merchant_response["id"]).to_not eq(merchant_2.id)

  end
end
