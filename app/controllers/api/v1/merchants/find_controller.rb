class Api::V1::Merchants::FindController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.find_by(item_params))
  end

  private

  def item_params
    params.permit("name", "created_at", "updated_at")
  end
end
