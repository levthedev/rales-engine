class Api::V1::ItemsController < ApplicationController
  def show
    respond_with Item.find_by(id: params[:id])
  end

  def index
    respond_with Item.load_all(params)
  end

  def random
    respond_with Item.all.sample
  end

  def find
    respond_with Item.find_by(params.first.first => params.first.last)
  end

  def find_all
    respond_with Item.where(params.first.first => params.first.last)
  end

  def merchant
    respond_with Item.find_by(id: params[:item_id]).merchant
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Item.most_items(params[:quantity])
  end

  def best_day
    respond_with Item.find_by(id: params[:id]).best_day
  end
end
