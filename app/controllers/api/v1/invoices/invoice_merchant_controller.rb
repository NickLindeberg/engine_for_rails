class Api::V1::Invoices::InvoiceMerchantController < ApplicationController

  def show
    render json: InvoiceMerchantSerializer.new(Invoice.find(params[:id]))
  end

end
