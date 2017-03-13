class Transaction < ApplicationRecord
  belongs_to :invoice

  has_many :customers, through: :invoice
  has_many :merchants, through: :invoice

  validates :credit_card_number, :result, presence: true
end
