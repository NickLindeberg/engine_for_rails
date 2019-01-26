class Api::V1::Invoices::FindController < ApplicationController

  def show
    render json: InvoiceSerializer.new(Invoice.find_by(inv_params))
  end

  private

  def inv_params
    params.permit("status")
  end
end
