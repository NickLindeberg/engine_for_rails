class Api::V1::Transactions::TransactionInvoiceController < ApplicationController

  def show
    render json: TransactionInvoiceSerializer.new(Transaction.find(params[:id]))
  end

end
