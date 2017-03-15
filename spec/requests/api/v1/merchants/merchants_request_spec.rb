require "rails_helper"
require "json"

describe "get index" do
  it "should be success" do
    Fabricate.times(2, :merchant)

    get "/api/v1/merchants.json"

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(2)
  end
end

describe "get show" do
  it "should be success" do
    merchant = Fabricate(:merchant)

    get "/api/v1/merchants/#{merchant.id}.json"

    expect(response).to be_success

    one_merchant = JSON.parse(response.body)

    expect(one_merchant["name"]).to eq("Fred")

  end
end

describe "find parameters" do
  it "should be success" do
    merchant = Fabricate(:merchant)
    Fabricate(:merchant)

    get "/api/v1/merchants/find?name=#{merchant.name}"

    expect(response).to be_success

    find_merchant = JSON.parse(response.body)

    expect(find_merchant["id"]).to eq(merchant.id)
    expect(find_merchant["name"]).to eq(merchant.name)
  end
end

describe "find all parameters" do
  it "should be success" do
    merchant = Fabricate(:merchant)
    Fabricate(:merchant)

    get "/api/v1/merchants/find_all?name=#{merchant.name.downcase}"

    expect(response).to be_success

    all_merchants = JSON.parse(response.body)

    expect(all_merchants.count).to eq(2)
  end
   it "should find by date" do
     merchant = Fabricate(:merchant, created_at: "2012-03-06T16:54:31.000Z")
     Fabricate(:merchant)

     get "/api/v1/merchants/find_all?created_at=#{merchant.created_at}"

     expect(response).to be_success

     all_merchants = JSON.parse(response.body)

     expect(all_merchants.count).to eq(1)
   end

   it "should find by id" do
     merchant = Fabricate(:merchant)
     Fabricate(:merchant)

     get "/api/v1/merchants/find_all?id=#{merchant.id}"

     expect(response).to be_success

     all_merchants = JSON.parse(response.body)

     expect(all_merchants.count).to eq(1)
   end
end

describe "random merchant" do
  it "should be a success" do
    Fabricate(:merchant)
    Fabricate(:merchant)

    get "/api/v1/merchants/random"

    expect(response).to be_success

    random = JSON.parse(response.body)
    expect(random).to have_key("id")
  end
end
