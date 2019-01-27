class Api::V1::Invoices::InvoiceTransactionsController < ApplicationController

  def show
    render json: InvoiceTransactionsSerializer.new(Invoice.find(params[:id]))
  end


end
