class Api::V1::InvoicesController < ApplicationController
  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def index
   respond_with Invoice.load_all(params)
  end

  def random
    respond_with Invoice.all.sample
  end

  def find
    respond_with Invoice.find_by(params.first.first => params.first.last)
  end

  def find_all
    respond_with Invoice.where(params.first.first => params.first.last)
  end

  def customer
    respond_with Invoice.find_by(id: params[:invoice_id]).customer
  end

  def merchant
    respond_with Invoice.find_by(id: params[:invoice_id]).merchant
  end
end
