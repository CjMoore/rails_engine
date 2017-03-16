class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :transactions
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :name, presence: true

  attr_accessor :total_revenue

  def get_favorite_customer
    self.customers
      .joins(:transactions)
      .merge(Transaction.success)
      .select("customers.*, count(invoices.customer_id) AS invoice_count")
      .group(:id)
      .order("invoice_count DESC")
      .limit(1)
      .first
  end

  def self.with_invoices
    joins(invoices: [:invoice_items, :transactions])
  end

  def self.merchant_revenue_on_date(date, id)
    with_invoices
      .merge(Transaction.success)
      .merge(Invoice.where("invoices.created_at = ?", "#{date}"))
      .where("merchants.id = '#{id}'")
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.total_revenue(id)
    with_invoices
      .merge(Transaction.success)
      .where(id: id)
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.most_items(number)
    with_invoices
      .merge(Transaction.success)
      .group("merchants.id")
      .select("merchants.*, SUM(invoice_items.quantity) as total_items")
      .order("total_items DESC")
      .limit(number)
  end

  def self.with_most_revenue(count)
    with_invoices
      .merge(Transaction.success)
      .group("merchants.id")
      .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .order("revenue DESC")
      .limit("#{count}")
  end

  def self.total_revenue_on_date(date)
    joins(invoices: [:transactions, :invoice_items])
      .merge(Transaction.success)
      .merge(Invoice.where("invoices.created_at = ?", "#{date}"))
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end
end
