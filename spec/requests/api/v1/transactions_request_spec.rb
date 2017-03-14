require "rails_helper"
require "json"

describe "get index" do
  it "should be success" do
    Fabricate.times(2, :transaction)

    get "/api/v1/transactions.json"

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(2)
  end
end

describe "get show" do
  it "should be success" do
    transaction = Fabricate(:transaction)

    get "/api/v1/transactions/#{transaction.id}.json"

    expect(response).to be_success

    one_transaction = JSON.parse(response.body)

    expect(one_transaction["result"]).to eq("success")

  end
end

describe "find parameters" do
  it "should be success" do
    transaction = Fabricate(:transaction)
    Fabricate(:transaction)

    get "/api/v1/transactions/find?result=#{transaction.result}"

    expect(response).to be_success

    find_transaction = JSON.parse(response.body)

    expect(find_transaction["id"]).to eq(transaction.id)
    expect(find_transaction["result"]).to eq(transaction.result)
  end
end

describe "find all parameters" do
  it "should be success" do
    transaction = Fabricate(:transaction)
    Fabricate(:transaction)

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction.credit_card_number}"

    expect(response).to be_success

    all_transactions = JSON.parse(response.body)

    expect(all_transactions.count).to eq(2)
  end

  describe "random transaction" do
    it "should be a success" do
      Fabricate(:transaction)
      Fabricate(:transaction)

      get "/api/v1/transactions/random"

      expect(response).to be_success

      random = JSON.parse(response.body)
      expect(random).to have_key("credit_card_number")
    end
  end
end
