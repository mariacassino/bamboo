class ItemsController < ApplicationController

def index
  @shop = Shop.find(params[:shop_id])
  @items = @shop.items.all
end

def show
  @shop = Shop.find(params[:shop_id])
  @item = @shop.items.find(params[:shop_id])
end

def new
  @shop = Shop.find(params[:shop_id])
  @item = @shop.items.new
  # @item.user_id = current_user.id
end

def create
  @shop = Shop.find(params[:shop_id])
  @item = @shop.items.new (approved_params)
  # @item.user_id = current_user.id
  if @item.save
    flash[:notice] = "Success!"
    redirect_to @item
  else
    render :new
  end
end

def edit
  @shop = Shop.find(params[:shop_id])
  @items = @shop.items.all
  @item = @shop.items.find(params[:shop_id])
end

def update
  @shop = Shop.find(params[:shop_id])
  @item = @shop.items.find(params[:shop_id])
  if @item.update(approved_params)
    flash[:notice] = "Success!"
    redirect_to shop_item_path
  else
    redirect_to shop_item_path
  end
end

def destroy
  @item = Item.find(params[:id])
  @item.destroy
  redirect_to items_path
end

private

def approved_params
  params.require(:item).permit(:name, :description, :price)
end




end
