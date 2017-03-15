require  "rails_helper"

describe "when user visits merchants/:id/favorite_customers" do
  it "they query and get the customer with the most transactions" do
    merchant = Fabricate(:merchant)
    customer = Fabricate(:customer)
    invoice1 = Fabricate(:invoice, merchant: merchant, customer: customer)
    transaction1, transaction2, transaction3 = Fabricate.times(3, :transaction, invoice: invoice1)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    expect(response).to be_success

    customer_response = JSON.parse(response.body)

    expect(customer_response["id"]).to eq(customer.id)
  end
end
