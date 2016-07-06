class ItemsController < ApplicationController

def index
  @items = Item.all
end

def show
  @item = Item.find(params[:id])
end

def new
  @item = Item.new
  # @item.user_id = current_user.id
end

def create
  @item = Item.new
  # @item.user_id = current_user.id
  if @item.save(approved_params)
    flash[:notice] = "Success!"
    redirect_to @item
  else
    render :new
  end
end

def edit
  @item = Item.find(params[:id])
end

def update
  @items = Item.all
  @item = Item.find(params[:id])
  if @item.update(approved_params)
    flash[:notice] = "Success!"
    redirect_to @item
  else
    redirect_to @item 
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
