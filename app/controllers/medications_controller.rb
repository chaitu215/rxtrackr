class MedicationsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!,
                only: [:index, :show, :destroy, :edit, :create, :update]
  before_action :set_user,
                only: [:index, :new, :create, :edit, :most_recent]
  before_action :set_medication,
                only: [:show, :edit, :update]
  before_action :set_note, only: [:show]
  before_action :set_provider_profile, only: [:index, :edit, :update]

  def index
    @medications = @user.medications.all
    @provider_profiles = @user.provider_profiles.all
  end

  def new
    @medication = Medication.new
    @note = @medication.notes.build
    @provider_profile = @medication.provider_profiles.build
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

  def most_recent
    if @medication = Medication.most_recent
      flash.now[:info] = "This is the most recently added or updated medication. (Last updated #{@medication.updated_at.strftime("%m-%e-%Y")})"
      render :show
    else
      flash.now[:danger] = "There are no medications."
      render :index
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
    @message = @medication.check_for_missing_info
    @provider_profile = @medication.provider_profiles.find_by(params[:medication_id]).name

    @note = Note.find_by(params[:medication_id])
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
      @note = Note.find_by(params[:medication_id]) unless @note.nil?
    end

    def set_provider_profile
      @provider_profile = ProviderProfile.find_by(params[:medication_id]) unless @provider_profile.nil?
    end

    def medication_params
      params.require(:medication).permit(:brand_name, :generic_name,
                                  :dose, :administration_route, :frequency,
                                  :doctor,
                                  notes_attributes: [
                                    :content, :user_id, :id, :_destroy
                                  ],
                                  provider_profiles_attributes: [
                                    :id, :_destroy, :name, :telephone, :address,
                                    :website, :user_id, :medication_id
                                  ])
    end
end
