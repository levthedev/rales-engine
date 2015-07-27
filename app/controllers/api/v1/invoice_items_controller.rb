class Api::V1::InvoiceItemsController < ApplicationController
  def random
    respond_with InvoiceItem.all.sample
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def search
    respond_with InvoiceItem.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with InvoiceItem.where(params.first.first => params.first.last)
  end
end
