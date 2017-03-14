require "rails_helper"
require "json"

describe "get index" do
  it "should be success" do
    Fabricate.times(2, :customer)

    get "/api/v1/customers.json"

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(2)
  end
end

describe "get show" do
  it "should be success" do
    customer = Fabricate(:customer)

    get "/api/v1/customers/#{customer.id}.json"

    expect(response).to be_success

    one_customer = JSON.parse(response.body)

    expect(one_customer["first_name"]).to eq("Bob")

  end
end

describe "find parameters" do
  it "should be success" do
    customer = Fabricate(:customer)
    Fabricate(:customer)

    get "/api/v1/customers/find?last_name=#{customer.last_name}"

    expect(response).to be_success

    find_customer = JSON.parse(response.body)

    expect(find_customer["id"]).to eq(customer.id)
    expect(find_customer["first_name"]).to eq(customer.first_name)
    expect(find_customer["last_name"]).to eq(customer.last_name)
  end
end

describe "find all parameters" do
  it "should be success" do
    customer = Fabricate(:customer)
    Fabricate(:customer)

    get "/api/v1/customers/find_all?first_name=#{customer.first_name}"

    expect(response).to be_success

    all_customers = JSON.parse(response.body)

    expect(all_customers.count).to eq(2)
  end

  describe "random customer" do
    it "should be a success" do
      Fabricate(:customer)
      Fabricate(:customer)

      get "/api/v1/customers/random"

      expect(response).to be_success

      random = JSON.parse(response.body)
      expect(random).to have_key("last_name")
    end
  end
end
