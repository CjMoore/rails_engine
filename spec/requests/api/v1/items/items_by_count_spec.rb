require "rails_helper"
require "json"

describe "get index" do
  it "returns the selected number of items" do
    item1, item2, item3 = Fabricate.times(3, :item)
    invoice1, invoice2, invoice3 = Fabricate.times(3, :invoice)
    Fabricate(:invoice_item, item: item1, invoice: invoice1)
    Fabricate(:invoice_item, item: item2, invoice: invoice1)
    Fabricate(:invoice_item, item: item1, invoice: invoice2)
    Fabricate(:invoice_item, item: item2, invoice: invoice2)
    Fabricate(:invoice_item, item: item3, invoice: invoice3)

    get '/api/v1/items/most_items?quantity=2'

    expect(response).to be_success

    item_response1 = JSON.parse(response.body).first
    item_response2 = JSON.parse(response.body).last

    expect(item_response1["id"]).to eq(item1.id)
    expect(item_response2["id"]).to eq(item2.id)
    expect(item_response2["id"]).to_not eq(item3.id)
  end
end
