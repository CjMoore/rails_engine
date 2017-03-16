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
    # byebug

    expect(customer_response["id"]).to eq(customer.id)
  end

  it "they do not see a customer that is not the favorite_customer" do
    merchant = Fabricate(:merchant)
    customer = Fabricate(:customer)
    customer2 = Fabricate(:customer, first_name: "Jeff", last_name: "Lebowski")
    invoice1 = Fabricate(:invoice, merchant: merchant, customer: customer)
    invoice2 = Fabricate(:invoice, merchant: merchant, customer: customer2)
    transaction4 = Fabricate(:transaction, invoice: invoice2)
    transaction1, transaction2, transaction3 = Fabricate.times(3, :transaction, invoice: invoice1)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    expect(response).to be_success

    customer_response = JSON.parse(response.body)

    expect(customer_response["id"]).to eq(customer.id)
    expect(customer_response["id"]).to_not eq(customer2.id)

  end
end
