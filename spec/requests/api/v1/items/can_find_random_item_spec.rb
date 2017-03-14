require 'rails_helper'

describe "when user visits items/random" do
  it "they are able to get a random item" do
    customer = Fabricate(:customer)
    item1= Fabricate( :item )

    get "/api/v1/items/random"

    expect(response).to be_success

    item_response = JSON.parse(response.body)

    expect(item1.id).to eq(item_response["id"])
  end
end
