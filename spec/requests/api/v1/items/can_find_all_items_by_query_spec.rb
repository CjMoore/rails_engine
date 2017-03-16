require 'rails_helper'

describe "when user queries items with find_all" do
  it "they can find_all with name" do
    item1, item2 = Fabricate.times(2, :item)

    get "/api/v1/items/find_all?name=#{item1.name}"

    expect(response).to be_success

    item1_response = JSON.parse(response.body).first
    item2_response = JSON.parse(response.body).last

    expect(item1.id).to eq(item1_response["id"])
    expect(item2.id).to eq(item2_response["id"])
  end

  it "they can find_all with merchant_id" do
    merchant = Fabricate(:merchant)
    item1, item2 = Fabricate.times(2, :item, merchant: merchant)

    get "/api/v1/items/find_all?merchant_id=#{item1.merchant_id}"

    expect(response).to be_success

    item1_response = JSON.parse(response.body).first
    item2_response = JSON.parse(response.body).last

    expect(item1.id).to eq(item1_response["id"])
    expect(item2.id).to eq(item2_response["id"])
  end

  it "they can find_all with description" do
    item1, item2 = Fabricate.times(2, :item)

    get "/api/v1/items/find_all?description=#{item1.description}"

    expect(response).to be_success

    item1_response = JSON.parse(response.body).first
    item2_response = JSON.parse(response.body).last

    expect(item1.id).to eq(item1_response["id"])
    expect(item2.id).to eq(item2_response["id"])
  end

  it "they can find_all with id" do
    item1, item2 = Fabricate.times(2, :item)

    get "/api/v1/items/find_all?id=#{item1.id}"

    expect(response).to be_success

    item1_response = JSON.parse(response.body).first
    item2_response = JSON.parse(response.body).last

    expect(item1.id).to eq(item1_response["id"])
    expect(item2.id).to_not eq(item2_response["id"])
  end

  it "they can find_all with unit_price" do
    item1, item2 = Fabricate.times(2, :item)

    unit_price = "1.23"

    get "/api/v1/items/find_all?unit_price=#{unit_price}"

    expect(response).to be_success

    item1_response = JSON.parse(response.body).first
    item2_response = JSON.parse(response.body).last

    expect(item1.id).to eq(item1_response["id"])
    expect(item2.id).to eq(item2_response["id"])
  end
end
