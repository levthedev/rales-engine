class Api::V1::TransactionsController < ApplicationController
  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def index
    respond_with Transaction.load_all(params)
  end

  def random
    respond_with Customer.all.sample
  end

  def find
    respond_with Transaction.find_by(params.first.first => params.first.last)
  end

  def find_all
    respond_with Transaction.where(params.first.first => params.first.last)
  end

  def invoice
    respond_with Transaction.find_by(id: params[:transaction_id]).invoice
  end
end
