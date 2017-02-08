class AllergiesController < ApplicationController
  before_action :authenticate_user!, only: [:allergy_list]

  def allergy_list
    if @allergy_list
      render :allergy_list
    end
  end

  private

  def allergies_params
    params.require(:allergy).permit(:user_id, :name, :description)
  end
end
