class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def random
    respond_with :json { Merchant.all.sample }
    respond_with :xml  { Merchant.all.sample }
  end

  def show
    respond_with :json { Merchant.find_by(id: params[:id]) }
    respond_with :xml  { Merchant.find_by(id: params[:id]) }
  end
end
