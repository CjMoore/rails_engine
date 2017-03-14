require 'rails_helper'

describe "when user queries invoices with find_all" do
  it "they can find_all with customer_id" do
    customer = Fabricate(:customer)
    invoice1, invoice2 = Fabricate.times(2, :invoice, customer: customer)

    get "/api/v1/invoices/find_all?customer_id=#{invoice1.customer_id}"

    expect(response).to be_success

    invoice1_response = JSON.parse(response.body).first
    invoice2_response = JSON.parse(response.body).last

    expect(invoice1.id).to eq(invoice1_response["id"])
    expect(invoice2.id).to eq(invoice2_response["id"])
  end

  it "they can find_all with status" do
    invoice1, invoice2 = Fabricate.times(2, :invoice)

    get "/api/v1/invoices/find_all?status=#{invoice1.status}"

    expect(response).to be_success

    invoice1_response = JSON.parse(response.body).first
    invoice2_response = JSON.parse(response.body).last

    expect(invoice1.id).to eq(invoice1_response["id"])
    expect(invoice2.id).to eq(invoice2_response["id"])
  end

  it "they can find_all with id" do
    invoice1, invoice2 = Fabricate.times(2, :invoice)

    get "/api/v1/invoices/find_all?id=#{invoice1.id}"

    expect(response).to be_success

    invoice1_response = JSON.parse(response.body).first
    invoice2_response = JSON.parse(response.body).last

    expect(invoice1.id).to eq(invoice1_response["id"])
    expect(invoice2.id).to_not eq(invoice2_response["id"])
  end
end
