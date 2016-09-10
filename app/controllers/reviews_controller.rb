class ReviewsController < ApplicationController


  def show
   @review = Review.find(params[:id])
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @item = @shop.items.find(params[:id])
    @review = Review.new
    @reviews = @item.reviews.all
  end


  def create
    @shop = Shop.find(params[:shop_id])
    @item = @shop.items.find(params[:id])
    @review = @item.review.new(review_params)
    @review.user_id = current_user.id
    @review.create!
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @review }
        # added:
        format.js   { render action: 'show', status: :created, location: @review }
      else
        # render :new
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end


private

  def review_params
    params.require(:review).permit(:review_text, :item_id)
  end

end
