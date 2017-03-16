class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :first_name, :last_name, presence: true

  def favorite_merchant
    self.merchants
      .joins(invoices: :transactions)
      .merge(Transaction.success)
      .select('merchants.*, count(invoices.customer_id) as total')
      .group('merchants.id')
      .order('total desc')
      .limit(1)
      .first
  end
end
