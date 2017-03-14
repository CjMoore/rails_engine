require 'rails_helper'

describe "user queries items with find" do
  it "by the name" do
    item1 = Fabricate(:item)

    get "/api/v1/items/find?name=#{item1.name}"

    expect(response).to be_success

    item = JSON.parse(response.body)
    expect(item["id"]).to eq(item1.id)
  end

  it "by the description" do
    item1 = Fabricate(:item)

    get "/api/v1/items/find?description=#{item1.description}"

    expect(response).to be_success

    item = JSON.parse(response.body)
    expect(item["id"]).to eq(item1.id)
  end

  it "by the unit_price" do
    item1 = Fabricate(:item)

    get "/api/v1/items/find?unit_price=#{item1.unit_price}"

    expect(response).to be_success

    item = JSON.parse(response.body)
    expect(item["id"]).to eq(item1.id)
  end

  it "by the item id" do
    item1 = Fabricate(:item)

    get "/api/v1/items/find?id=#{item1.id}"

    expect(response).to be_success

    item = JSON.parse(response.body)
    expect(item["id"]).to eq(item1.id)
  end

  it "can find by created_at" do
    item1 = Item.create(name: "Thing",
                        description: "it does the thing",
                        merchant: Fabricate(:merchant),
                        unit_price: 1234,
                        created_at: "2012-03-06T16:54:31.000Z")


    get "/api/v1/items/find?created_at=#{item1.created_at}"

    expect(response).to be_success
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(item1.id)
  end

  it "can find by merchant_id" do
    item1 = Fabricate(:item)

    get "/api/v1/items/find?merchant_id=#{item1.merchant_id}"

    expect(response).to be_success

    item = JSON.parse(response.body)
    expect(item["id"]).to eq(item1.id)
  end
end
