require "rails_helper"

describe "get all transactions for an invoice" do
  it "returns all associated transactions" do
    invoice = Fabricate(:invoice, transactions: [])
    transaction_1 = Fabricate(:transaction, invoice: invoice)
    transaction_2 = Fabricate(:transaction, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success

    transaction_response = JSON.parse(response.body)

    expect(transaction_response.first["id"]).to eq(transaction_1.id)
    expect(transaction_response.last["id"]).to eq(transaction_2.id)
  end
end

describe "get all invoice_items for an invoice" do
  it "returns all associated invoice_items" do
    invoice = Fabricate(:invoice)
    invoice_item_1 = Fabricate(:invoice_item, invoice: invoice)
    invoice_item_2 = Fabricate(:invoice_item, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_success

    invoice_item_response = JSON.parse(response.body)

    expect(invoice_item_response.first["id"]).to eq(invoice_item_1.id)
    expect(invoice_item_response.last["id"]).to eq(invoice_item_2.id)
  end
end

describe "get all items for an invoice" do
  it "returns all associated items" do
    item_1, item_2 = Fabricate.times(2, :item)
    invoice_item = Fabricate.build(:invoice_item, item: item_1)
    invoice_item_2 = Fabricate.build(:invoice_item, item: item_2)
    invoice = Fabricate(:invoice, invoice_items: [invoice_item, invoice_item_2])

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_success

    item_response = JSON.parse(response.body)

    expect(item_response.first["id"]).to eq(item_1.id)
    expect(item_response.last["id"]).to eq(item_2.id)
  end
end

describe "get customer for an invoice" do
  it "returns the associated customer" do
    customer = Fabricate(:customer)
    invoice = Fabricate(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_success

    customer_response = JSON.parse(response.body)

    expect(customer_response["id"]).to eq(customer.id)
  end
end

describe "get merchant for an invoice" do
  it "returns the associated merchant" do
    merchant = Fabricate(:merchant)
    invoice = Fabricate(:invoice, merchant: merchant)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_success

    merchant_response = JSON.parse(response.body)

    expect(merchant_response["id"]).to eq(merchant.id)
  end
end
