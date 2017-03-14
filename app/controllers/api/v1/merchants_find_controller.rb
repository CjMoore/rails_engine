class Api::V1::MerchantsFindController < ApplicationController

  def index
    merchants = find_merchants
    if merchants
      render json: find_merchants
    end
  end

  def show
    merchant = find_merchant
    if merchant
      render json: find_merchant
    else
      head 404
    end
  end

  private
  def find_merchant
    key = find_params_key
    if key == "created_at" || key == "updated_at"
      time = DateTime.parse(params[key])
      Merchant.where(key => time).first
    elsif key
      Merchant.find_by(key => params[key])
    end
  end

  def find_merchants
    key = find_params_key
    if key == "created_at" || key == "updated_at"
      time = DateTime.parse(params[key])
      Merchant.where(key => time)
    elsif key
      Merchant.where(key => params[key])
    end
  end

  def find_params_key
    params.keys.find do |key|
      [:name, :id, :created_at, :updated_at].include?(key.downcase.to_sym)
    end
  end
end
