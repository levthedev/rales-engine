class Api::V1::CustomersController < ApplicationController
  def random
    respond_with Customer.all.sample
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def search
    respond_with Customer.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with Customer.where(params.first.first => params.first.last)
  end
end
