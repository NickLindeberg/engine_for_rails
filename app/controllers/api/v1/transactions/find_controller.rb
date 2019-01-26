class Api::V1::Transactions::FindController < ApplicationController

  def show
    render json: TransactionSerializer.new(Transaction.find_by(tran_params))
  end

  private

  def tran_params
    params.permit("credit_card_number", "result", "created_at", "updated_at")
  end
end
