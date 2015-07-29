class Api::V1::CustomersController < ApplicationController
  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def index
    respond_with Customer.all
  end

  def random
    respond_with Customer.all.sample
  end

  def find
    respond_with Customer.find_by(params.first.first => params.first.last)
  end

  def find_all
    respond_with Customer.where(params.first.first => params.first.last)
  end

  def transactions
    respond_with Customer.find_by(id: params[:customer_id]).transactions
  end

  def favorite_merchant
    respond_with Customer.find_by(id: params[:customer_id]).favorite_merchant
  end
end
