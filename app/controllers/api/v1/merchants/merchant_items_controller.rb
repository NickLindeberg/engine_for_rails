class Api::V1::Merchants::MerchantItemsController < ApplicationController

  def show
    render json: MerchantItemsSerializer.new(Merchant.find(params[:id]))
  end

end
