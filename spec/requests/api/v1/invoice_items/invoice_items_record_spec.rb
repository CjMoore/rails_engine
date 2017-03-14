require 'rails_helper'

describe "invoice_items record endpoints" do
  it "sends a list of invoice_itemss" do
    invoice_item1, invoice_items2, invoice_items3 = Fabricate.times(3, :invoice_item)

    get '/api/v1/invoice_items'

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(3)
  end

  it "can get one invoice_items by id" do
    invoice_item_id = Fabricate(:invoice_item).id

    get "/api/v1/invoice_items/#{invoice_item_id}"

    expect(response).to be_success
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(invoice_item_id)
  end
end
