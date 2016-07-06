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
    CSV.foreach(file.path, headers: true) do |row|
      #Create objects here from each row
      row
    end
  end

  def test
  end

  def new
    @shop = Shop.new
    # @shop.user_id = current_user.id
  end

  def create
    @shop = Shop.new
    # @shop.user_id = current_user.id
    if @shop.save
      flash[:notice] = "Success!"
      redirect_to @shop
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shops = Shop.all
    @shop = Shop.find(params[:id])
    if @shop.update
      flash[:notice] = "Success!"
      redirect_to shops_path
    else
      redirect_to shops_path
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @board.destroy
    redirect_to shops_path
  end




















end
