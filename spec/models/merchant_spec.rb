require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "relationships" do
    it { should have_many(:items) }
    it { should have_many(:invoices) }
    it { should have_many(:transactions)}
  end
  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "total_revenue" do
    it "should return total revenue for a merchant" do
      merchant = Fabricate(:merchant)
      invoice = Fabricate(:invoice, merchant: merchant)
      invoice_item = Fabricate(:invoice_item, invoice: invoice, quantity: 2, unit_price: 1000)

      expect(merchant.reload.total_revenue).to eq(2000)
    end
  end
end
