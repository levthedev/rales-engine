class Api::V1::InvoiceItemsController < ApplicationController
  def random
    respond_with InvoiceItem.all.sample
  end

  def show
    InvoiceItem.find_by(id: params[:id])
  end

end
