class MedicationsController < ApplicationController
  before_action :authenticate_user!,
                only: [:index, :show, :destroy, :edit, :create, :update]
  before_action :set_user,
                only: [:index, :create]
  before_action :set_medication,
                only: [:show, :edit, :update]

  def index
    @medications = @user.medications.all
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = @user.medications.build(medication_params)
    if @medication.save
      flash[:success] = "Saved successfully"
      redirect_to @medication
    else
      render :new
    end
  end

  def edit
  end

  def update
    @medication.update(medication_params)
    if @medication.save
      flash[:success] = "Saved successfully"
      redirect_to @medication
    else
      render :edit
    end
  end

  def show
    @note = @medication.notes.first
    @message = @medication.check_for_missing_info
    flash.now[:info] = @message unless @message.nil?
  end

  def destroy
    medication = Medication.find(params[:id])
    user = medication.user
    medication.destroy
    flash[:success] = "Medication was successfully deleted."
    redirect_to user_medications_path(user)
  end

  private

    def set_user
      @user = current_user
    end

    def set_medication
      @medication = Medication.find(params[:id])
    end

    def set_note
      @note = Note.find(params[:id])
    end

    def medication_params
      params.require(:medication).permit(:brand_name, :generic_name,
                                  :dose, :administration_route,
                                  :frequency, :doctor)
    end
end
