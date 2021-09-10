class AppointmentsController < ApplicationController
  def index
    if current_user
      @appointments = current_user.appointments.sort_by.sort_by { :date }.reverse
    else
      if (params[:user])
        @appointments = current_doctor.appointments
        @appointments = @appointments.select {|app| app.user_id == params[:user].to_i}
      else
        @appointments = current_doctor.appointments
      end
    end
  end

  def new
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @doctor = Doctor.find(params[:doctor_id])
    @appointment.doctor = @doctor
    if @appointment.save
      redirect_to appointments_path
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :description)
  end
end
