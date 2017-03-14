class Api::V1::ItemsFindController< ApplicationController
  def index
    @items =  Item.where(find_params)
  end

  def show
    @item = Item.find_by(find_params)
  end

  private

  def find_params
    params.permit(:name, :merchant_id, :id, :description, :unit_price, :created_at, :updated_at)
  end

  def get_key
    params.keys.find do |key|
      [:name, :merchant_id, :id, :description, :unit_price, :created_at, :updated_at].include?(key.downcase.to_sym)
    end
  end

end
