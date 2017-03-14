require 'rails_helper'

describe "user queries invoices with find" do
  it "by the customer_id" do
    invoice1 = Fabricate(:invoice)

    get "/api/v1/invoices/find?customer_id=#{invoice1.customer_id}"

    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(invoice1.id)
  end

  it "by the merchant_id" do
    invoice1 = Fabricate(:invoice)

    get "/api/v1/invoices/find?merchant_id=#{invoice1.merchant_id}"

    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(invoice1.id)
  end

  it "by the time status" do
    invoice1 = Fabricate(:invoice)

    get "/api/v1/invoices/find?status=#{invoice1.status}"

    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(invoice1.id)
  end

  it "by the invoice id" do
    invoice1 = Fabricate(:invoice)

    get "/api/v1/invoices/find?status=#{invoice1.status}"

    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(invoice1.id)
  end

  # it "can find by created_at" do
  #   invoice1 = Invoice.create(customer: Fabricate(:customer),
  #                             merchant: Fabricate(:merchant),
  #                             status: "Shipped")
  #
  #
  #   get "/api/v1/invoices/find?created_at=#{invoice1.created_at}"
  #
  #   expect(response).to be_success
  #   invoice = JSON.parse(response.body)
  #   expect(invoice["id"]).to eq(invoice1.id)
  # end
end
