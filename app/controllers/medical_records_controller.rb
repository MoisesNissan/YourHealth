class MedicalRecordsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @medical_records = @user.medical_records
  end

  def show
    @medical_record = MedicalRecord.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @medical_record = MedicalRecord.new
  end

  def create
    @medical_record = MedicalRecord.new(medical_record_params)
    @medical_record.user = User.find(params[:user_id])
    # @doctor = Doctor.find(params[:doctor_id])
    @medical_record.doctor = current_doctor
    if @medical_record.save
      redirect_to user_medical_records_path(@medical_record.user)
    else
      render :new
    end
  end

  private

  def medical_record_params
    params.require(:medical_record).permit(:lab_results, :medications, :description)
  end
end
