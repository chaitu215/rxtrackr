class ProviderProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_provider_profile, only: [:index, :edit, :delete]

  def index
    @provider_profiles = ProviderProfile.all
  end

  def provider_profiles
    if @provider_profiles
      render :providers
    end
  end

  def show
    @medication = @user.medications.find_by(params[:medication_id])
    @provider_profile = ProviderProfile.find(params[:id])
  end

  def new
    @provider_profile = ProviderProfile.new
  end

  def edit
  end

  def create
    @provider_profile = ProviderProfile.new(provider_profiles_params)

    respond_to do |format|
      if @provider_profile.save
        format.html { redirect_to @provider_profile, notice: 'Provider profile was successfully created.' }
        format.json { render :show, status: :created, location: @provider_profile }
      else
        format.html { render :new }
        format.json { render json: @provider_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @provider_profile.update(provider_profile_params)
        format.html { redirect_to @provider_profile, notice: 'Provider profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider_profile }
      else
        format.html { render :edit }
        format.json { render json: @provider_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @provider_profile.destroy
    respond_to do |format|
      format.html { redirect_to provider_profiles_url, notice: 'Provider profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_provider_profile
      @provider_profile = ProviderProfile.find(params[:id]) unless @provider_profile.nil?
    end

    def set_user
      @user = current_user
    end

    def provider_profiles_params
      params.require(:provider_profile).permit(:name, :telephone,
                                               :address, :website, :medication_id,
                                               :user_id,
                                               medications_attributes: [
                                                :brand_name, :generic_name, :id
                                              ])
    end
end
