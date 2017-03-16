class Api::V1::Item::ItemsMostItemsController< ApplicationController
  def index
    if params[:quantity]
      render json: Item.most_items(params[:quantity])
    end
  end
end
