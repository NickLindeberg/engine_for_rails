class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.where(ii_params))
  end

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(ii_params))
  end

  private

  def ii_params
    params.permit("quantity", "unit_price", "created_at", "updated_at")
  end
end
