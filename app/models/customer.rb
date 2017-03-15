class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :first_name, :last_name, presence: true

  def self.favorite_merchant(customer)
    Merchant.joins(invoices: :transactions)
      .where('invoices.customer.id = ?', customer.id)
      .merge(Transaction.success)
      .select('merchants.*, count(invoices.customer_id) as total')
      .group('merchants.id')
      .order('total desc')
  end
end
