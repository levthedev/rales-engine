class Api::V1::MerchantsController < ApplicationController
  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def random
    respond_with Merchant.all.sample
  end

  def search
    respond_with Merchant.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with Merchant.where(params.first.first => params.first.last)
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity])
  end
end
