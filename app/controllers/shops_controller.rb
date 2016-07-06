class ShopsController < ApplicationController
  skip_after_action :verify_authorized, only: [:index, :show]


  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    # @item = @shop.items.first
    @items = @shop.items.all
  end

  def import
    file = params[:file]
    # FIXME Need to add PUNDIT permission
    shop = Shop.find(params[:shop_id])

    CSV.foreach(file.path, headers: true) do |row|
      shop.items.create!(name: row["Item"], description: row["Description"], price: row["Price"])
    end

    redirect_to shop_path(shop)

  end

  def test
  end

  def new
    @shop = Shop.new
    @shop.user_id = current_user.id
  end

  def create
    @shop = Shop.new(approved_params)
    @shop.user_id = current_user.id
    if @shop.save
      flash[:notice] = "Success!"
      redirect_to @shop
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
    authorize @shop
  end

  def update
    @shops = Shop.all
    @shop = Shop.find(params[:id])
    authorize @shop
    if @shop.update(approved_params)
      flash[:notice] = "Success!"
      redirect_to shops_path
    else
      redirect_to shops_path
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    authorize @shop
    @shop.destroy
    redirect_to shops_path
  end



  private

  def approved_params
    params.require(:shop).permit(:name, :description, :location)
  end


end
