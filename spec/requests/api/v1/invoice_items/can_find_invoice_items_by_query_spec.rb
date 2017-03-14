require 'rails_helper'

describe "user queries invoice_items with find" do
  it "by the item_id" do
    invoice_item1 = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?item_id=#{invoice_item1.item_id}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(invoice_item1.id)
  end

  it "by the invoice_id" do
    invoice_item1 = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_item1.invoice_id}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(invoice_item1.id)
  end

  it "by the unit_price" do
    invoice_item1 = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item1.unit_price}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(invoice_item1.id)
  end

  it "by the invoice_item id" do
    invoice_item1 = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?id=#{invoice_item1.id}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(invoice_item1.id)
  end

  it "can find by created_at" do
    invoice_item1 = InvoiceItem.create(item: Fabricate(:item),
                        invoice: Fabricate(:invoice),
                        quantity: 2,
                        unit_price: 1234,
                        created_at: "2012-03-06T16:54:31.000Z")


    get "/api/v1/invoice_items/find?created_at=#{invoice_item1.created_at}"

    expect(response).to be_success
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(invoice_item1.id)
  end

  it "can find by quantity" do
    invoice_item1 = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item1.quantity}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(invoice_item1.id)
  end
end
