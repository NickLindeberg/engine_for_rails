class Api::V1::InvoiceItems::InvoiceItemsItemController < ApplicationController

  def show
    render json: InvoiceItemsItemSerializer.new(InvoiceItem.find(params[:id]))
  end

end
