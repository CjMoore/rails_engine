class Api::V1::TransactionsFindController < ApplicationController

  def index
    transactions = find_transactions
    if transactions
      render json: find_transactions
    end
  end

  def show
    transaction = find_transaction
    if transaction
      render json: find_transaction
    else
      head 404
    end
  end

  private
  def find_transaction
    key = find_params_key
    if key == "created_at" || key == "updated_at"
      time = DateTime.parse(params[key])
      Transaction.where(key => time).first
    elsif key == "id" || key == "invoice_id"
      Transaction.find(params[key])
    elsif key
      Transaction.find_by("lower(#{key}) = ?", params[key].downcase)
    end
  end

  def find_transactions
    key = find_params_key
    if key == "created_at" || key == "updated_at"
      time = DateTime.parse(params[key])
      Transaction.where(key => time)
    elsif key == "id" || key == "invoice_id"
      Transaction.where(key => params[key])
    elsif key
      Transaction.where("lower(#{key}) = ?", params[key].downcase)
    end
  end

  def find_params_key
    params.keys.find do |key|
      [:id, :created_at, :updated_at, :invoice_id, :credit_card_number, :result]
        .include?(key.downcase.to_sym)
    end
  end
end
