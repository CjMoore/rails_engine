class Api::V1::Merchants::MerchantsItemsController < ApplicationController

  def index
    @items = Merchant.find(params[:merchant_id]).items
  end
end
