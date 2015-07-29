class Api::V1::MerchantsController < ApplicationController
  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def index
    respond_with Merchant.all
  end

  def random
    respond_with Merchant.all.sample
  end

  def find
    respond_with Merchant.find_by(params.first.first => params.first.last)
  end

  def find_all
    respond_with Merchant.where(params.first.first => params.first.last)
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Merchant.most_items(params[:quantity])
  end

  def revenue
    respond_with Merchant.revenue(params[:date])
  end

  def favorite_customer
    respond_with Merchant.find_by(id: params[:id]).favorite_customer
  end

  def pending
    respond_with Merchant.find_by(id: params[:id]).customers_with_pending_invoices
  end
end
