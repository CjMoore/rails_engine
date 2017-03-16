require "rails_helper"

describe "get all invoice_items for an item" do
  it "returns all associated invoice_items" do
    item = Fabricate(:item)
    invoice_item_1 = Fabricate(:invoice_item, item: item)
    invoice_item_2 = Fabricate(:invoice_item, item: item)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_success

    invoice_item_response = JSON.parse(response.body)

    expect(invoice_item_response.first["id"]).to eq(invoice_item_1.id)
    expect(invoice_item_response.last["id"]).to eq(invoice_item_2.id)
  end
end
