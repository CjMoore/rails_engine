class Api::V1::Item::ItemsBestDayController< ApplicationController

  def show
    render json: Item.find(params[:item_id]).best_day
  end
end
