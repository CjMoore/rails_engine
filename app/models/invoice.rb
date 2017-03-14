class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant

  has_many :transactions

  validates :status, presence: true

  def self.get_by_param(params)
    if params.include?("customer_id")
      find_by(customer_id: params["customer_id"])
    elsif params.include?("merchant_id")
      find_by(merchant_id: params["merchant_id"])
    elsif params.include?("status")
      find_by(status: params["status"])
    elsif params.inculde?("updated_at")
      find_by(updated_at: params["updated_at"])
    elsif params.include?("created_at")
      find_by(created_at: params["created_at"])
    elsif params.include?("id")
      find_by(id: params["id"])
    else
      nil
    end
  end
end
