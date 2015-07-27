class Api::V1::TransactionsController < ApplicationController
  def random
    respond_with Transaction.all.sample
  end

  def show
    Transaction.find_by(id: params[:id])
  end
end
