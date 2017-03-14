require 'rails_helper'

describe "when user queries invoice_items with find_all" do
  it "they can find_all with item_id" do
    invoice_item1, invoice_item2 = Fabricate.times(2, :invoice_item, item: Fabricate(:item))

    get "/api/v1/invoice_items/find_all?item_id=#{invoice_item1.item_id}"

    expect(response).to be_success

    invoice_item1_response = JSON.parse(response.body).first
    invoice_item2_response = JSON.parse(response.body).last

    expect(invoice_item1.id).to eq(invoice_item1_response["id"])
    expect(invoice_item2.id).to eq(invoice_item2_response["id"])
  end


  it "they can find_all with invoice_id" do
    invoice_item1, invoice_item2 = Fabricate.times(2, :invoice_item, invoice: Fabricate(:invoice))

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice_item1.invoice_id}"

    expect(response).to be_success

    invoice_item1_response = JSON.parse(response.body).first
    invoice_item2_response = JSON.parse(response.body).last

    expect(invoice_item1.id).to eq(invoice_item1_response["id"])
    expect(invoice_item2.id).to eq(invoice_item2_response["id"])
  end

  it "they can find_all with id" do
    invoice_item1, invoice_item2 = Fabricate.times(2, :invoice_item)

    get "/api/v1/invoice_items/find_all?id=#{invoice_item1.id}"

    expect(response).to be_success

    invoice_item1_response = JSON.parse(response.body).first
    invoice_item2_response = JSON.parse(response.body).last

    expect(invoice_item1.id).to eq(invoice_item1_response["id"])
  end

  it "they can find_all with quantity" do
    invoice_item1, invoice_item2 = Fabricate.times(2, :invoice_item)

    get "/api/v1/invoice_items/find_all?quantity=#{invoice_item1.quantity}"

    expect(response).to be_success

    invoice_item1_response = JSON.parse(response.body).first
    invoice_item2_response = JSON.parse(response.body).last

    expect(invoice_item1.id).to eq(invoice_item1_response["id"])
    expect(invoice_item2.id).to eq(invoice_item2_response["id"])
  end
end
