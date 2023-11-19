class ReviewsController < ApplicationController
  before_action :set_apartment, only: [:new, :create]

  def new
    @apartment = set_apartment
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.apartment = set_apartment
    if @review.save
      redirect_to apartment_path(@apartment), notice: 'Review was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'Review could not be created.'
    end
  end

  def destroy
    @review= Review.find(params[:id])
    @review.destroy
    redirect_to apartment_path(@review.apartment), status: :see_other, notice: 'Review was successfully destroyed.'
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end
end
