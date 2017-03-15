require 'rails_helper'

RSpec.describe Item, type: :model do
  context "relationships" do
    it { should belong_to(:merchant) }
    it { should have_many(:invoice_items) }
    it { should have_many(:invoices) }
  end
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
  end

  context "items_most_revenue" do
    it "returns a list of items in order of most revenue" do
      item1, item2, item3 = Fabricate.times(3, :item)
      invoice1, invoice2, invoice3 = Fabricate.times(3, :invoice)
      invoice_items1 = Fabricate(:invoice_item, item: item1, invoice: invoice1)
      invoice_items2 = Fabricate(:invoice_item, item: item2, invoice: invoice1)
      invoice_items3 = Fabricate(:invoice_item, item: item1, invoice: invoice2)
      invoice_items4 = Fabricate(:invoice_item, item: item2, invoice: invoice2)
      invoice_items5 = Fabricate(:invoice_item, item: item3, invoice: invoice3)

      items = Item.with_most_revenue(2)

      expect(items.first.id).to eq(item1.id)
      expect(items.last.id).to eq(item2.id)
    end
  end
end
