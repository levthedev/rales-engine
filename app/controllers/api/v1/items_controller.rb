class Api::V1::ItemsController < ApplicationController
  def random
    respond_with Item.all.sample
  end

  def show
    Item.find_by(id: params[:id])
  end
end
