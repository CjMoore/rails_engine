require 'rails_helper'

describe "item record endpoints" do
  it "sends a list of items" do
    item1, item2, item3 = Fabricate.times(3, :item)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it "can get one item by id" do
    item_id = Fabricate(:item).id

    get "/api/v1/items/#{item_id}"

    expect(response).to be_success
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(item_id)
  end
end
