class Api::V1::MerchantsController < ApplicationController
  def random
    respond_with Merchant.all.sample
  end

  def show
    Merchant.find_by(id: params[:id])
  end
end
