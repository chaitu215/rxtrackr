class MedicationsController < ApplicationController
  before_action :set_user, only: [:index, :show]

  def index
  end

  def show
    @medication = @user.Medication.find(params[:id])
  end

  private

    def set_user
      @user = User.find_by(params[:id])
    end
end
