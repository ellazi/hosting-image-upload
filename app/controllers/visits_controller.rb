class VisitsController < ApplicationController
  before_action :set_apartment, only: [:new, :create]

  def new
    @apartment = set_apartment
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.apartment = set_apartment
    @visit.user = current_user
    if @visit.save
      redirect_to apartment_path(@apartment), notice: 'You can now visit this glorious heaven.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    redirect_to apartment_path(@visit.apartment), status: :see_other, notice: 'Booking was successfully destroyed.'
  end

  private

  def visit_params
    params.require(:visit).permit(:date)
  end

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end
end
