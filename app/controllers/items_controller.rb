class ItemsController < ApplicationController

  def index
    @shop = Shop.find(params[:id])
    @items = @shop.items.all
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @item = @shop.items.find(params[:id])
    @end_date = (@item.sale_start + @item.sale_length.days).strftime("%A, %B %e, %Y %l:%M %P %Z")
  end

  def new
    @shop = Shop.find(params[:shop_id])
    authorize @shop
    @item = @shop.items.new
    authorize @item
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
    authorize @shop
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
      redirect_to shop_path(@shop)
    else
      redirect_to shop_item_path
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @item = @shop.items.find(params[:shop_id])
    authorize @item
    @item.destroy
    redirect_to shop_path
  end

  def random
    @shop = Shop.find(params[:shop_id])
    @random = @shop.items.all.sample
  end

  def new_sale
    @shop = Shop.find(params[:shop_id])
    @item = @shop.items.find(params[:item_id])
    @item.on_sale = true
    @item.sale_start = Time.now.strftime("%A, %B %e, %Y %l:%M %P %Z")
    if @item.save
      flash[:notice] = "Success!"
    else
      render :new
    end
  end

  # def sale_end_date
  #   @shop = Shop.find(params[:shop_id])
  #   @item = @shop.items.find(params[:id])
  #   (@item.sale_start + @item.sale_length.days).strftime("%A, %B %e, %Y %l:%M %P %Z")
  # end

  private

  def approved_params
    params.require(:item).permit(:name, :description, :price, :shop_id, :image, :sale_price, :sale_length)
  end




end
