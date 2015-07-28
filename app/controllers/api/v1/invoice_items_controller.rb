class Api::V1::InvoiceItemsController < ApplicationController
  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def index
    InvoiceItem.load_all(params)
  end

  def random
    respond_with InvoiceItem.all.sample
  end

  def search
    respond_with InvoiceItem.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with InvoiceItem.where(params.first.first => params.first.last)
  end

  def invoice
    respond_with InvoiceItem.find_by(id: params[:invoice_item_id]).invoice
  end

  def item
    respond_with InvoiceItem.find_by(id: params[:invoice_item_id]).item
  end
end
