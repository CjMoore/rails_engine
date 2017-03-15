class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def total_revenue
    invoices.select(&:successful?).reduce(0) do |total, invoice|
      total += invoice.total
    end
  end

  def self.with_invoices
    includes(invoices: [:invoice_items, :transactions])
  end
end
