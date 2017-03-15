class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :name, presence: true

  attr_accessor :total_revenue

  def self.get_favorite_customer(merchant)
    Customer.find(Customer.joins(:transactions, :invoices).where("invoices.merchant_id = ? and result = ?", merchant.id, "success").select("customers.*, invoices.customer_id, transactions.result").group("invoices.customer_id").order("count_id DESC").count('id').first.first)
  end

  def total_revenue
    invoices.select(&:successful?).reduce(0) do |total, invoice|
      total += invoice.total
    end
  end

  def self.with_invoices
    includes(invoices: [:invoice_items, :transactions])
  end

end
