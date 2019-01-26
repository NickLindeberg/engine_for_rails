class Api::V1::Merchants::FindController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.find_by(merc_params))
  end

  private

  def merc_params
    params.permit("name", "created_at", "updated_at")
  end
end
