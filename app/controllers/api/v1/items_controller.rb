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
end
