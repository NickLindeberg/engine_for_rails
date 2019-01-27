class Api::V1::Items::ItemInvoiceItemController < ApplicationController

  def show
    render json: ItemInvoiceItemSerializer.new(Item.find(params[:id]))
  end

end
