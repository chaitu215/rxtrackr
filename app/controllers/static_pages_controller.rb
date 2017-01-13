class StaticPagesController < ApplicationController
  def home
    if current_user
      redirect_to users_path
    else
      render :home
    end
  end

  def about
  end

  def contact
  end
end
