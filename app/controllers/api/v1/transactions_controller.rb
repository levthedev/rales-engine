class Api::V1::TransactionsController < ApplicationController
  def random
    respond_with Transaction.all.sample
  end

  def show
    respond_with Transaction.find_by(id: params[:id])
  end
end
