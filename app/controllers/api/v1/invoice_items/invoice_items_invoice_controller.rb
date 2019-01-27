class Api::V1::InvoiceItems::InvoiceItemsInvoiceController < ApplicationController

  def show
    render json: InvoiceItemsInvoiceSerializer.new(InvoiceItem.find(params[:id]))
  end

end
