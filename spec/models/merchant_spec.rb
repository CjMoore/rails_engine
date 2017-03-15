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

  context "favorite_customer" do
    it "can find favorite_customer" do
      merchant = Fabricate(:merchant)
      customer = Fabricate(:customer)
      invoice1 = Fabricate(:invoice, merchant: merchant, customer: customer)
      transaction1, transaction2, transaction3 = Fabricate.times(3, :transaction, invoice: invoice1)

      favorite_customer = Merchant.get_favorite_customer(merchant)

      expect(favorite_customer.first_name).to eq("Bob")
      expect(favorite_customer.last_name).to eq("Burger")
    end
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
