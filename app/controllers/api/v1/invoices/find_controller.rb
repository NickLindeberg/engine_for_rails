class Api::V1::Invoices::FindController < ApplicationController

  def index
    render json: InvoiceSerializer.new(Invoice.where(inv_params))
  end

  def show
    render json: InvoiceSerializer.new(Invoice.find_by(inv_params))
  end

  private

  def inv_params
    params.permit("status", "created_at", "updated_at")
  end
end
