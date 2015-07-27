class Api::V1::InvoicesController < ApplicationController
  def random
    respond_with Invoice.all.sample
  end

  def show
    respond_with Invoice.find_by(id: params[:id])
  end
end
