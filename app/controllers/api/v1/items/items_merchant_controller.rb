class Api::V1::ItemsMerchantController < ApplicationController
  def show
    @merchant = Item.find(params[:item_id]).merchant
  end
end
