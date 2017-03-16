class ApplicationController < ActionController::API

  def format_unit_price(unit_price)
    (unit_price.to_f * 100).round(2).to_i
  end

end
