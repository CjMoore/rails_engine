class Api::V1::Item::ItemsBestDayController< ApplicationController
  def show
    item = Item.find(params[:item_id])
    render json: Item.best_day(item).first
  end
end
