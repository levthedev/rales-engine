class Api::V1::ItemsController < ApplicationController
  def random
    respond_with Item.all.sample
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def search
    respond_with Item.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with Item.where(params.first.first => params.first.last)
  end

  def merchant
    respond_with Item.find_by(id: params[:item_id]).merchant
  end

  def index
    if params[:merchant_id]
      respond_with Item.where(merchant_id: params[:merchant_id])
    elsif params[:invoice_id]
      respond_with Invoice.find_by(id: params[:invoice_id]).items
    else
      respond_with Item.all
    end
  end
end
