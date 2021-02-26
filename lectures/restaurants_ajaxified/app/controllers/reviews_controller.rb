class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      respond_to do |format|
        # Accept: text/html
        format.html { redirect_to restaurant_path(@restaurant) }
        # Accept: text/javascript
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'restaurants/show' }
        format.js { render 'reviews/reload_form' }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end