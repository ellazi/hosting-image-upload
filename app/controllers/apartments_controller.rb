class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  def index
    @apartments = Apartment.all
  end

  def show
    @apartment = set_apartment
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    if @apartment.save
      redirect_to apartment_path(@apartment), notice: 'Apartment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @apartment = set_apartment
  end

  def update
    @apartment = set_apartment
    @apartment.update(apartment_params)
    redirect_to apartment_path(@apartment), notice: 'Apartment was successfully updated.'
  end

  def destroy
    @apartment = set_apartment
    @apartment.destroy
    redirect_to root_path, notice: 'Apartment was successfully destroyed.'
  end

  private

  def apartment_params
    params.require(:apartment).permit(:name, :address, :price, :square_meters, :description)
  end

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end
end
