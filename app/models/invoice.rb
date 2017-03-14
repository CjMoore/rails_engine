class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant

  has_many :transactions

  validates :status, presence: true

  def self.get_by_key(key, params)
    if key == "created_at" || key == "updated_at"
      date = params[key].to_datetime
      find_by(key => date)
    elsif key
      find_by(key => params[key])
    end
  end

  def self.get_all_by_key(key, params)
    if key == "created_at" || key == "updated_at"
      date = params[key].to_datetime
      where(key => date)
    elsif key
      where(key => params[key])
    end
  end


end
