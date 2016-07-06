class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @items = @shop.items.all
  end

  def import
    # TODO #needs to create item objects and have proper redirection
    file = params[:file]
    # FIXME Need to add PUNDIT permission
    shop = Shop.find(params[:shop_id])
    CSV.foreach(file.path, headers: true) do |row|
      #Create objects here from each row
      shop.items.create!(name: row["Item"], description: row["Description"], price: row["Price"])
    end

    redirect_to shop_path(shop)

  end

  def test
  end



















end
