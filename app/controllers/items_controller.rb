class ItemsController < ApplicationController

def index
  @shop = Shop.find(params[:id])
  @items = @shop.items.all
end

def show
  @shop = Shop.find(params[:shop_id])
  @item = @shop.items.find(params[:id])
end

def new
  @shop = Shop.find(params[:shop_id])
  # authorize @shop
  @item = @shop.items.new
  # authorize @item
  @item.user_id = current_user.id
end

def create
  @shop = Shop.find(params[:shop_id])
  @item = @shop.items.new(approved_params)
  @item.user_id = current_user.id
  authorize @item
  authorize @shop
  if @item.save
    flash[:notice] = "Success!"
    redirect_to shop_path(@shop)
  else
    render :new
  end
end

def edit
  @shop = Shop.find(params[:id])
  # authorize @shop
  @items = @shop.items.all
  @item = @shop.items.find(params[:shop_id])
  authorize @item
end

def update
  @shop = Shop.find(params[:shop_id])
  @item = @shop.items.find(params[:id])
  authorize @item
  if @item.update(approved_params)
    flash[:notice] = "Success!"
    redirect_to shop_item_path
  else
    redirect_to shop_item_path
  end
end

def destroy
  @shop = Shop.find(params[:shop_id])
  @item = @shop.items.find(params[:id])
  authorize @item
  @item.destroy
  redirect_to shop_path
end

private

def approved_params
  params.require(:item).permit(:name, :description, :price)
end




end
