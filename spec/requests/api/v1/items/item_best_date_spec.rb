require "rails_helper"
require "json"

describe "get index" do
  it "returns items ranked by amount sold" do
    item_1, item_2 = Fabricate.times(2, :item)
    invoice_1 = Fabricate(:invoice)
    invoice_2 = Fabricate(:invoice, created_at: "2012-03-06T16:54:31.000Z")

    Fabricate(:invoice_item, invoice: invoice_2, item: item_1)
    Fabricate(:invoice_item, invoice: invoice_1, item: item_2)
    Fabricate(:invoice_item, invoice: invoice_2, item: item_1)

    get "/api/v1/items/#{item_1.id}/best_day"

    expect(response).to be_successful

    best_day = JSON.parse(response)

    expect(best_day["date"]).to eq(invoice_2.created_at)
  end
end
