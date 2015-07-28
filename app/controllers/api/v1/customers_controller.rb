class Api::V1::CustomersController < ApplicationController
  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def random
    respond_with Customer.all.sample
  end

  def search
    respond_with Customer.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with Customer.where(params.first.first => params.first.last)
  end

  def transactions
    respond_with Customer.find_by(id: params[:customer_id]).transactions
  end
end
