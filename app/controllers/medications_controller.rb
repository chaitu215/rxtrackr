class MedicationsController < ApplicationController
  before_action :set_user,
                only: [:index, :create, :edit, :update,
                      :show, :destroy]
  before_action :set_medication,
                only: [:edit, :update, :show, :destroy]

  def index
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
    @medication.destroy
    redirect_to user_medications_path,
      notice: "Medication was successfully deleted."
  end

  private

    def set_user
      @user = User.find_by(params[:id])
    end

    def set_medication
      @medication = @user.medications.find(params[:id])
    end

    def medication_params
      params.require(:medication).permit(:brand_name, :generic_name,
                                  :dose, :administration_route,
                                  :frequency, :doctor)
    end
end
