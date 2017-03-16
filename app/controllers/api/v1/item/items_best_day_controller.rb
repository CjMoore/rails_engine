class Api::V1::Item::ItemsBestDayController< ApplicationController
  def show
    # item = Item.find(params[:item_id])
    render json: Item.find(params[:item_id]).best_day
  end
end
