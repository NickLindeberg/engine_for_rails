class Api::V1::Invoices::InvoiceInvoiceItemsController < ApplicationController

  def show
    render json: InvoiceInvoiceItemsSerializer.new(Invoice.find(params[:id]))
  end

end
