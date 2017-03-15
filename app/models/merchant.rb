class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :name, presence: true

  attr_accessor :total_revenue

  def self.get_favorite_customer(merchant)
    Customer.joins(:transactions, :invoices).merge(Invoice.where("invoices.merchant_id = ?", merchant.id)).merge(Transaction.where(result: 'success')).select("customers.*, count(invoices.customer_id) AS customer_count").group(:id).order("customer_count DESC").limit(1)
  end

  def total_revenue(date=nil)
    if date
      invoices_by_date(date).reduce(0) do |total, invoice|
        total += invoice.total
      end
    else
      invoices.select(&:successful?).reduce(0) do |total, invoice|
        total += invoice.total
      end
    end
  end

  def self.with_invoices
    includes(invoices: [:invoice_items, :transactions])
  end

  def invoices_by_date(date)
    invoices.select(&:successful?).select do |invoice|
      DateTime.parse(date) == invoice.date
    end
  end

  def self.most_items(number)
    select("merchants.*, SUM(invoice_items.quantity) as total_items")
      .joins(:invoice_items)
      .joins("JOIN transactions ON transactions.invoice_id = invoices.id AND transactions.result = 'success'")
      .having("COUNT(transactions.id) > 0")
      .group("merchants.id")
      .order("total_items DESC").limit(number)
  end

  def self.with_most_revenue(count)
    joins(invoices: [:transactions, :invoice_items])
      .merge(Transaction.where(result: "success"))
      .group("merchants.id").select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .order("revenue DESC").limit("#{count}")
  end

  def self.total_revenue_on_date(date)
    joins(invoices: [:transactions, :invoice_items])
      .merge(Transaction.where(result:"success"))
      .merge(Invoice.where("invoices.created_at = ?", "#{date}"))
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end
end
