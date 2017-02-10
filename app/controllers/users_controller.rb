class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :user_notes]
  before_action :set_user,           only: [:index, :show, :user_notes]

  def index
  end

  def show
    @allergy_list = current_user.allergies.select(:name).map(&:name).uniq.sort
    @provider_profiles = current_user.provider_profiles.select(:name).map(&:name).uniq.sort
  end

  def user_notes
    @notes = @user.notes.all
  end

  private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(provider_profiles_attributes: [
                                    :id, :_destroy, :name, :telephone, :address,
                                    :website, :user_id, :medication_id
                                  ])
    end
end
