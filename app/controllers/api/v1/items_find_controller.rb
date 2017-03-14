class Api::V1::ItemsFindController< ApplicationController
  def index
    key = get_key
    render json: Item.get_all_by_key(key, params)
  end

  def show
    key = get_key
    render json: Item.get_by_key(key, params)
  end

  private

  def get_key
    params.keys.find do |key|
      [:name, :merchant_id, :id, :description, :unit_price, :created_at, :updated_at].include?(key.downcase.to_sym)
    end
  end

end
