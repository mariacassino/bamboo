class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  # def show
  #   @shops = Shop.find(params[:id])
  # end


end
