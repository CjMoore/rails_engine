class Api::V1::MerchantsMostItemsController < ApplicationController

  def index
    @merchants = Merchant.most_items(params[:quantity])
  end

end
