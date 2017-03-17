class Api::V1::Item::ItemsFindController< ApplicationController

  def index
    if params[:unit_price]
      @items = Item.where(unit_price: format_unit_price(params[:unit_price]))
    else
      @items =  Item.where(find_params)
    end
  end

  def show
    if params[:unit_price]
      @item = Item.find_by(unit_price: format_unit_price(params[:unit_price]))
    else
      @item = Item.find_by(find_params)
    end
  end

  private

  def find_params
    params.permit(:name,
                  :merchant_id,
                  :id,
                  :description,
                  :unit_price,
                  :created_at,
                  :updated_at)
  end
end
