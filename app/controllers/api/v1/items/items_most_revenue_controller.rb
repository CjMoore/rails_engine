class  Api::V1::ItemsMostRevenueController < ApplicationController

  def index
    if params[:quantity]
      @items = Item.with_most_revenue(params[:quantity])
    end
  end

end
