class Api::V1::Merchants::MerchantsMostItemsController < ApplicationController

  def index
    @merchants = Merchant.most_items(params[:quantity])
  end

end
