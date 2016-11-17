class MedicationsController < ApplicationController
  before_action :authenticate_user!,
                only: [:index, :show, :destroy, :edit, :create, :update]
  before_action :set_user,
                only: [:index, :create]
  before_action :set_medication,
                only: [:show, :edit, :update]

  def index
    @medications = @user.medications.all
    @medication = Medication.find_by(params[:id])
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = @user.medications.build(medication_params)
    if @medication.save
      redirect_to @medication,
      notice: "Medication was successfully added."
    else
      render :new, notice: "Please try again."
    end
  end

  def edit
  end

  def update
    @medication.update(medication_params)
    if @medication.save
      redirect_to @medication,
        notice: "Medication was successfully edited."
    else
      render :edit, notice: "Please try again."
    end
  end

  def show
  end

  def destroy
    medication = Medication.find(params[:id])
    user = medication.user
    medication.destroy
    redirect_to user_medications_path(user),
      notice: "Medication was successfully deleted."
  end

  private

    def set_user
      @user = User.find_by(params[:id])
    end

    def set_medication
      @medication = Medication.find(params[:id])
    end

    def medication_params
      params.require(:medication).permit(:brand_name, :generic_name,
                                  :dose, :administration_route,
                                  :frequency, :doctor)
    end
end
