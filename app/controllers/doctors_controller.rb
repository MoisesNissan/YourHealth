class DoctorsController < ApplicationController
  def index
    if params[:query].present?
      @doctors = Doctor.global_search(params[:query])
    else
      @doctors = Doctor.all
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end
end
