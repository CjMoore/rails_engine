class Api::V1::CustomersFindController < ApplicationController

  def index
    customers = find_customers
    if customers
      render json: find_customers
    end
  end

  def show
    customer = find_customer
    if customer
      render json: find_customer
    else
      head 404
    end
  end

  private
  def find_customer
    key = find_params_key
    if key == "created_at" || key == "updated_at"
      time = DateTime.parse(params[key])
      Customer.where(key => time).first
    elsif key == "id"
      Customer.find(params[key])
    elsif key
      Customer.find_by("lower(#{key}) = ?", params[key].downcase)
    end
  end

  def find_customers
    key = find_params_key
    if key == "created_at" || key == "updated_at"
      time = DateTime.parse(params[key])
      Customer.where(key => time)
    elsif key == "id"
      Customer.where(key => params[key])
    elsif key
      Customer.where("lower(#{key}) = ?", params[key].downcase)
    end
  end

  def find_params_key
    params.keys.find do |key|
      [:first_name, :last_name, :id, :created_at, :updated_at].include?(key.downcase.to_sym)
    end
  end
end
