class Api::V1::ItemsController < ApplicationController
  def random
    respond_with Item.all.sample
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def search
    respond_with Item.find_by(params[0][0] => params[0][1])
  end
end
