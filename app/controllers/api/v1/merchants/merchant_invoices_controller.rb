class Api::V1::Merchants::MerchantInvoicesController < ApplicationController

  def show
    render json: MerchantInvoicesSerializer.new(Merchant.find(params[:id]))
  end

end
