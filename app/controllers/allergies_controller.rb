class AllergiesController < ApplicationController
  before_action :authenticate_user!, only: [:allergy_list]

  def allergy_list
    if @allergy_list
      render :allergy_list
    end
  end
end
