class Api::V1::Item::ItemsRandomController < ApplicationController

  def show
    @item = Item.random
  end

end
