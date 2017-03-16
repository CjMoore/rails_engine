class Api::V1::MerchantsItemsController < ApplicationController

  def index
    @items = Merchant.find(params[:merchant_id]).items
  end
end
