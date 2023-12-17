class AppointmentsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @apartment = Apartment.find(params[:apartment_id])
    @user = current_user
    @appointment = Appointment.new
  end

  def create
    @apartment = Apartment.find(params[:apartment_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.apartment = @apartment
    @appointment.user = current_user
    if @appointment.save
      redirect_to apartment_path(@apartment), notice: 'Appointment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
end
