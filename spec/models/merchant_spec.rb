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
      Fabricate.times(3, :transaction, invoice: invoice1)

      favorite_customer = Merchant.get_favorite_customer(merchant)

      expect(favorite_customer.first.first_name).to eq("Bob")
      expect(favorite_customer.first.last_name).to eq("Burger")
    end
  end

  context "total_revenue" do
    it "should return total revenue for a merchant" do
      merchant = Fabricate(:merchant)
      invoice = Fabricate(:invoice, merchant: merchant)
      Fabricate(:invoice_item, invoice: invoice, quantity: 2, unit_price: 1000)

      expect(merchant.reload.total_revenue).to eq(2000)
    end

    it "should return total revenue on a particular date for all merchants" do
      merchant1, merchant2 = Fabricate.times(2, :merchant)
      invoice = Fabricate(:invoice, merchant: merchant1, created_at: "2012-03-06T16:54:31.000Z")
      invoice_2 = Fabricate(:invoice, merchant: merchant2, created_at: "2012-04-06T16:54:21.000Z")
      Fabricate(:invoice_item, invoice: invoice, quantity: 2, unit_price: 1000)
      Fabricate(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 1000)

      total_revenue = Merchant.total_revenue_on_date(invoice.created_at)

      expect(2000).to eq(total_revenue)
    end
  end

  context "with_most_revenue" do
    it "returns a list of merchants with the most revenue" do
      merchant1, merchant2 = Fabricate.times(2, :merchant)
      invoice1 = Fabricate(:invoice, merchant: merchant1)
      invoice2 = Fabricate(:invoice, merchant: merchant2)
      Fabricate(:invoice_item, invoice: invoice1)
      Fabricate(:invoice_item, invoice: invoice2)

      merchants = Merchant.with_most_revenue(2)

      expect(merchants.first.id).to eq(merchant1.id)
      expect(merchants.last.id).to eq(merchant2.id)
    end
  end

  context "invoices_by_date" do
    it "should return invoices with matching dates" do
      merchant = Fabricate(:merchant)
      invoice = Fabricate(:invoice, merchant: merchant, created_at: "2012-03-06T16:54:31.000Z")
      invoice_2 = Fabricate(:invoice, merchant: merchant, created_at: "2012-04-06T16:54:21.000Z")
      Fabricate(:invoice_item, invoice: invoice, quantity: 2, unit_price: 1000)
      Fabricate(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 1000)

      expect(merchant.invoices_by_date(invoice.created_at.to_s).count).to eq(1)
    end
  end
end
