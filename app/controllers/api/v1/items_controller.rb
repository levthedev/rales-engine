class Api::V1::ItemsController < ApplicationController
  def show
    respond_with Item.find_by(id: params[:id])
  end

  def index
    Item.load_all(params)
  end

  def random
    respond_with Item.all.sample
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
end
